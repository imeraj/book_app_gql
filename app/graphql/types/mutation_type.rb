Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  BookInputType = GraphQL::InputObjectType.define do
    name "BookInputType"
    argument :title, types.String
    argument :publisher, types.String
    argument :genre, types.String
  end

  field :createBook, Types::BookType do
    argument :book, BookInputType

    resolve ->(obj, args, ctx) {
      book = Book.create!(title: args[:title],
                          publisher: args[:publisher],
                          genre: args[:genre])
      book
    }
  end

  field :deleteBook, Types::BookType do
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      book = Book.find_by_id(args[:id])
      book.destroy!
    }
  end

end
