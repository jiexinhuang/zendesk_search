RSpec.describe ZendeskSearch::DataSet do
  let(:records) { [record_1, record_2, record_3] }
  let(:record_1) { double }
  let(:record_2) { double }
  let(:record_3) { double }

  let(:name) { "User" }
  let(:model_class) { double(index: []) }
  subject(:data_set) { ZendeskSearch::DataSet.new(name: name, records: records, model_class: model_class) }


  describe 'given initialized DataSet' do
    its(:name) { is_expected.to eq name }
    its(:records) { is_expected.to eq records }
  end

  describe '#search' do
    let(:matching_model) { double }
    let(:query_hash) { { _id: 1, name: 'John' } }
    subject(:search) { data_set.search(query_hash) }
    before do
      allow(model_class).to receive(:new).and_return(matching_model)
      allow(record_1).to receive(:match?).with(matching_model, [:_id, :name]).and_return(true)
      allow(record_2).to receive(:match?).with(matching_model, [:_id, :name]).and_return(false)
      allow(record_3).to receive(:match?).with(matching_model, [:_id, :name]).and_return(true)
    end

    it 'returns records that match with query hash' do
      expect(search).to eq [record_1, record_3]
    end
  end
end
