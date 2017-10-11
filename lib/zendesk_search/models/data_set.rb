module ZendeskSearch
  class DataSet
    attr_reader :name, :records

    def initialize(name:, records: [], model_class:)
      @name = name
      @records = records
      @model_class = model_class
      @index_attributes = model_class.index
      index_records
    end

    def search(query_hash)
      matching_model = model_class.new(query_hash)
      filtered_record_indexes = filter_records_with_index(query_hash.keys, matching_model)
      if filtered_record_indexes.nil?
        records.select do |record|
          record.match?(matching_model, query_hash.keys)
        end
      else
        filtered_record_indexes.select do |record_index|
          records[record_index].match?(matching_model, query_hash.keys)
        end.map do |record_index|
          records[record_index]
        end
      end
    end

    private

    attr_reader :model_class, :index_attributes

    def filter_records_with_index(query_attributes, matching_model)
      indexes_to_use = index_attributes & query_attributes
      if indexes_to_use.any?
        indexes_to_use.map do |attr|
          hash_key = matching_model[attr].hash
          @index[attr][hash_key]
        end.flatten.uniq
      end
    end

    def index_records
      @index = {}
      index_attributes.each do |index_attr|
        @index[index_attr] = {}
        records.each_with_index do |record, index|
          hash_key = record[index_attr].hash
          @index[index_attr][hash_key] = [] if @index[index_attr][hash_key].nil?
          @index[index_attr][hash_key] << index
        end
      end
    end
  end
end
