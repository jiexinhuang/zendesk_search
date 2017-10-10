module ZendeskSearch
  class BaseModel < Dry::Struct::Value
    constructor_type :schema

    def self.attribute_type(attribute_name)
      schema[attribute_name].name
    end

    def match?(query_hash)
      matching_model = self.class.new(query_hash)
      query_hash.all? do |key, value|
        if self[key].instance_of?(Array)
          !(self[key] & matching_model[key]).empty?
        else
          self[key] == matching_model[key]
        end
      end
    end
  end
end
