Types::AuthorType = GraphQL::ObjectType.define do
  name "Author"
  field :id, !types.ID
  field :name, types.String
  field :address, types.String
end
