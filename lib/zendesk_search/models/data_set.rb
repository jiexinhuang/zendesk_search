module ZendeskSearch
  class DataSet
    attr_reader :name, :records

    def initialize(name:, records: [], model_class:)
      @name = name
      @records = records
      @model_class = model_class
    end

    def search(query_hash)
      matching_model = @model_class.new(query_hash)
      @records.select do |record|
        record.match?(matching_model, query_hash.keys)
      end
    end
  end
end
