class Resolvers::CreateUser < GraphQL::Function
  argument :user, Types::UserInputType

  # return type for this mutation
  attr_reader :type

  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  def call(_obj, args, _ctx)
    User.create!(name:  args[:user][:name],
                email:  args[:user][:email],
              password: args[:user][:password])

    rescue ActiveRecord::RecordInvalid => e
    # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end

end
