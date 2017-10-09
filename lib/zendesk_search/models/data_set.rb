module ZendeskSearch
  class DataSet
    attr_reader :name, :records

    def initialize(name:, records: [])
      @name = name
      @records = records
    end

    def search(query_hash)
      @records.select do |record|
        record.match?(query_hash)
      end
    end
  end
end
