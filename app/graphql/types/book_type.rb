Types::BookType = GraphQL::ObjectType.define do
  name "Book"
  field :id, !types.ID
  field :title, types.String
  field :publisher, types.String
  field :genre, types.String
  field :authors do
    type types[!Types::AuthorType]
    argument :size, types.Int, default_value: 10
    resolve -> (book, args, ctx) {
      book.authors.limit(args[:size])
    }
  end

end
