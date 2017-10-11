require 'json'

module ZendeskSearch
  module Utils
    module DataImporter
      def self.import(json_string:, model_name:, model_class:)
        json_array = JSON.parse(json_string, symbolize_names: true)
        records = json_array.map do |data_hash|
          model_class.new(data_hash)
        end
        ZendeskSearch::DataSet.new(name: model_name, records: records, model_class: model_class)
      end
    end
  end
end
