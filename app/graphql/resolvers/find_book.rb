class Resolvers::FindBook < GraphQL::Function
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  argument :id, !types.ID

  def call(obj, args, ctx)
    @model_class.find_by_id(args[:id])
  end

end
