Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :book do
    type Types::BookType
    argument :id, !types.ID
    description "Find a Book by ID"
    resolve -> (obj, args, ctx) {
      Book.find(args[:id])
    }
  end

end
