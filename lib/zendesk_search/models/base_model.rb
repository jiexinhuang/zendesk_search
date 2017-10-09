module ZendeskSearch
  class BaseModel < Dry::Struct::Value
    constructor_type :schema

    def match?(query_hash)
      matching_model = self.class.new(query_hash)
      query_hash.all? do |key, value|
        self[key] == matching_model[key]
      end
    end
  end
end
