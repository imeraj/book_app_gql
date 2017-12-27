Types::BookType = GraphQL::ObjectType.define do
  name "Book"
  field :id, types.ID
  field :title, types.String
  field :publisher, types.String
  field :genre, types.String
  field :authors, function: Resolvers::FindAuthor.new(model_class: Author, type: types[Types::AuthorType])

end
