Types::BookInputType = GraphQL::InputObjectType.define do
  name "BookInputType"
  argument :title, types.String
  argument :publisher, types.String
  argument :genre, types.String
end
