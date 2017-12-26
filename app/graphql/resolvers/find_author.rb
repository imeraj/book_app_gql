class Resolvers::FindAuthor < GraphQL::Function
  argument :size, types.Int, default_value: 10
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  def call(book, args, ctx)
    book.authors.limit(args[:size])
  end

end
