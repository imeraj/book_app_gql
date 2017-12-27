Types::BookInputType = GraphQL::InputObjectType.define do
  name "BookInput"
  argument :title, !types.String
  argument :publisher, !types.String
  argument :genre, types.String
  argument :authors, !types[Types::AuthorInputType]
end
