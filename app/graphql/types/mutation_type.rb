require_relative "../mutations/create_book"
require_relative "../mutations/delete_book"

Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createBook, function: Resolvers::CreateBook.new(model_class: Book, type: Types::BookType)
  field :deleteBook, function: Resolvers::DeleteBook.new(model_class: Book, type: Types::BookType)

end
