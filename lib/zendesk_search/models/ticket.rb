module ZendeskSearch
  class Ticket < Dry::Struct::Value
    attribute :_id,             Types::Coercible::String
    attribute :submitter_id,    Types::Coercible::Int
    attribute :assignee_id,     Types::Coercible::Int
    attribute :organization_id, Types::Coercible::Int

    attribute :url,             Types::Coercible::String
    attribute :external_id,     Types::Coercible::String
    attribute :type,            Types::Coercible::String
    attribute :subject,         Types::Coercible::String
    attribute :description,     Types::Coercible::String
    attribute :priority,        Types::Coercible::String
    attribute :status,          Types::Coercible::String
    attribute :via,             Types::Coercible::String


    attribute :has_incidents,   Types::Bool

    attribute :created_at,      Types::Json::Time
    attribute :due_at,          Types::Json::Time

    attribute :tags,            Types::Json::Array
  end
end
