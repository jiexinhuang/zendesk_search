class ImporterTestModel < ZendeskSearch::BaseModel
  attribute :_id,       ZendeskSearch::Types::Coercible::Int.optional
  attribute :name,      ZendeskSearch::Types::Coercible::String
end

RSpec.describe ZendeskSearch::Utils::DataImporter do
  describe '.import' do
    let(:model_class) { ImporterTestModel }
    let(:json_string) do
      <<~JSON
        [
          {
            "_id": 1,
            "name": "Ronaldo"
          },
          {
            "_id": 2,
            "name": "Messi"
          },
          {
            "_id": 3,
            "name": "Griezmann"
          }
        ]
      JSON
    end

    subject(:import) do
      ZendeskSearch::Utils::DataImporter.import(
        json_string: json_string,
        model_name: 'Test Model',
        model_class: ImporterTestModel,
      )
    end

    it 'returns a data set with given name' do
      expect(import).to be_instance_of(ZendeskSearch::DataSet)
      expect(import.name).to eq 'Test Model'
    end

    it 'returns a data set that contains intialized records of initialized model from data' do
      expect(import.records.size).to eq 3
      expect(import.records[0]._id).to eq 1
      expect(import.records[0].name).to eq 'Ronaldo'
      expect(import.records[1]._id).to eq 2
      expect(import.records[1].name).to eq 'Messi'
      expect(import.records[2]._id).to eq 3
      expect(import.records[2].name).to eq 'Griezmann'
    end
  end
end
