module ZendeskSearch
  class BaseModel < Dry::Struct::Value
    constructor_type :schema

    def self.index(*index_attributes)
      if index_attributes.any?
        @index_attributes = index_attributes.map(&:to_sym)
      else
        @index_attributes || []
      end
    end

    def self.attribute_type(attribute_name)
      schema[attribute_name].name
    end

    def match?(matching_model, attributes)
      attributes.all? do |attr|
        if self[attr].instance_of?(Array)
          !(self[attr] & matching_model[attr]).empty?
        else
          self[attr] == matching_model[attr]
        end
      end
    end
  end
end
