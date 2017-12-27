require_relative "../mutations/create_book"
require_relative "../mutations/delete_book"
require_relative "../mutations/create_user"
require_relative "../mutations/sign_in_user"

Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signInUser, function: Resolvers::SignInUser.new(model_class: User)
  field :createUser, function: Resolvers::CreateUser.new(model_class: User, type: Types::UserType)
  field :createBook, function: Resolvers::CreateBook.new(model_class: Book, type: Types::BookType)
  field :deleteBook, function: Resolvers::DeleteBook.new(model_class: Book, type: Types::BookType)

end
