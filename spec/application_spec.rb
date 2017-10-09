RSpec.describe ZendeskSearch::Application, type: :integration do
  subject(:application) do
    ZendeskSearch::Application.new(data_file_dir: 'spec/data/', model_classes: model_classes)
  end
  let(:model_classes) do
    {
      users: ZendeskSearch::User,
    }
  end

  describe '#search' do
    subject(:search) { application.search(:users, query_hash) }

    context 'when searching for records with matching id' do
      let(:query_hash) { { _id: 1 } }
      it 'returns 1 record with matching id' do
        expect(search.size).to eq 1
        expect(search.first).to be_instance_of(ZendeskSearch::User)
        expect(search.first._id).to eq 1
      end
    end

    context 'when searching for records matching locale' do
      let(:query_hash) { { locale: 'zh-CN' } }

      it 'returns record with matching locale' do
        expect(search.size).to eq 2
        expect(search.first._id).to eq 2
        expect(search.last._id).to eq 5
      end
    end
  end
end
