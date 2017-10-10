module ZendeskSearch
  class Organization < BaseModel
    attribute :_id,             Types::Coercible::Int.optional

    attribute :url,             Types::Coercible::String
    attribute :external_id,     Types::Coercible::String
    attribute :name,            Types::Coercible::String
    attribute :details,         Types::Coercible::String

    attribute :shared_tickets,  Types::Form::Bool

    attribute :created_at,      Types::Json::Time
    attribute :domain_names,    Types::Coercible::Array
    attribute :tags,            Types::Coercible::Array

    index :_id, :name
  end
end
