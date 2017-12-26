Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :book, function: Resolvers::FindBook.new(model_class: Book, type: Types::BookType)

end
