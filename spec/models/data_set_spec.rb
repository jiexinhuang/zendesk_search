RSpec.describe ZendeskSearch::DataSet do
  let(:records) { [record_1, record_2, record_3] }
  let(:record_1) { double }
  let(:record_2) { double }
  let(:record_3) { double }

  let(:name) { "User" }
  let(:model_class) { double(index: [:_id]) }
  subject(:data_set) { ZendeskSearch::DataSet.new(name: name, records: records, model_class: model_class) }
  
  before do
    allow(record_1).to receive(:[]).with(:_id).and_return(1)
    allow(record_2).to receive(:[]).with(:_id).and_return(2)
    allow(record_3).to receive(:[]).with(:_id).and_return(3)
  end

  describe 'given initialized DataSet' do
    its(:name) { is_expected.to eq name }
    its(:records) { is_expected.to eq records }
  end

  describe '#search' do
    let(:matching_model) { double }
    subject(:search) { data_set.search(query_hash) }

    before do
      allow(model_class).to receive(:new).and_return(matching_model)
      allow(record_1).to receive(:match?).and_return(true)
      allow(record_2).to receive(:match?).and_return(false)
      allow(record_3).to receive(:match?).and_return(true)
    end

    context 'when searching for unindexed attribute' do
      let(:query_hash) { { name: 'John' } }

      it 'checks all records and see if they match with query param' do
        search
        expect(record_1).to have_received(:match?).with(matching_model, [:name])
        expect(record_2).to have_received(:match?).with(matching_model, [:name])
        expect(record_3).to have_received(:match?).with(matching_model, [:name])
      end

      it 'returns records that match with query hash' do
        expect(search).to eq [record_1, record_3]
      end
    end

    context 'when searching for indexed attribute' do
      let(:query_hash) { { _id: 1, name: 'John' } }
      before do
        allow(matching_model).to receive(:[]).with(:_id).and_return(1)
      end

      it 'returns records filtered by index and match with query hash' do
        expect(search).to eq [record_1]
      end

      it 'only checks records with matching index and see if they match with query param' do
        search
        expect(record_1).to have_received(:match?).with(matching_model, [:_id, :name])
        expect(record_2).not_to have_received(:match?)
        expect(record_3).not_to have_received(:match?)
      end
    end
  end
end
