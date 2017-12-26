class Resolvers::CreateBook < GraphQL::Function
  argument :book, Types::BookInputType

  # return type for this mutation
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  def call(_obj, args, _ctx)
    @model_class.create!(title: args[:title],
                     publisher: args[:publisher],
                         genre: args[:genre])
  end

end
