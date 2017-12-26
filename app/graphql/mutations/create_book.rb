class Resolvers::CreateBook < GraphQL::Function
  argument :book, Types::BookInputType

  # return type for this mutation
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  def call(_obj, args, _ctx)
    ActiveRecord::Base.transaction do
      book = @model_class.create!(title: args[:book][:title],
                     publisher: args[:book][:publisher],
                         genre: args[:book][:genre])

      authors = args[:book][:authors]
      authors.each do |author|
        book.authors.create!(name: author.name, address: author.address)
      end
    book
    end

    rescue ActiveRecord::RecordInvalid => e
    # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end

end
