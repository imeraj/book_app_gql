Types::AuthorInputType = GraphQL::InputObjectType.define do
  name "AuthorInput"
  argument :name, types.String
  argument :address, types.String
end
