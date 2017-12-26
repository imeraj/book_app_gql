class Resolvers::DeleteBook < GraphQL::Function
  argument :id, !types.ID
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  def call(obj, args, ctx)
    book = @model_class.find_by_id(args[:id])
    book.destroy! unless book.nil?
  end

end
