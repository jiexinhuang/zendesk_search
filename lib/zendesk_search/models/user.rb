module ZendeskSearch
  class User < BaseModel
    attribute :_id,             Types::Coercible::Int.optional
    attribute :organization_id, Types::Coercible::Int.optional

    attribute :url,             Types::Coercible::String
    attribute :external_id,     Types::Coercible::String
    attribute :name,            Types::Coercible::String
    attribute :alias,           Types::Coercible::String
    attribute :role,            Types::Coercible::String
    attribute :locale,          Types::Coercible::String
    attribute :timezone,        Types::Coercible::String
    attribute :email,           Types::Coercible::String
    attribute :phone,           Types::Coercible::String
    attribute :signature,       Types::Coercible::String

    attribute :active,          Types::Form::Bool
    attribute :verified,        Types::Form::Bool
    attribute :shared,          Types::Form::Bool
    attribute :suspended,       Types::Form::Bool

    attribute :last_login_at,   Types::Json::Time
    attribute :created_at,      Types::Json::Time
    attribute :tags,            Types::Json::Array
  end
end
