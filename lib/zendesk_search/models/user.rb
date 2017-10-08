module ZendeskSearch
  class User < Dry::Struct
    attribute :name, Types::Coercible::String
  end
end
