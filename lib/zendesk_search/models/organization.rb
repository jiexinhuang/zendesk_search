module ZendeskSearch
  class Organization < Dry::Struct::Value
    attribute :_id,             Types::Coercible::Int

    attribute :url,             Types::Coercible::String
    attribute :external_id,     Types::Coercible::String
    attribute :name,            Types::Coercible::String
    attribute :details,         Types::Coercible::String

    attribute :shared_tickets,  Types::Bool

    attribute :created_at,      Types::Json::Time
    attribute :domain_names,    Types::Json::Array
    attribute :tags,            Types::Json::Array
  end
end