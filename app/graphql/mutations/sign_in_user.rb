class Resolvers::SignInUser < GraphQL::Function
  argument :auth_params, !Types::AuthProviderInputType

  # defines inline return type for the mutation
  type do
    name "SignInResponse"

    field :token, types.String
    field :user, Types::UserType
  end

  def initialize(model_class:)
    @model_class = model_class
  end

  def call(_obj, args, _ctx)
    user = @model_class.find_by_email(args[:auth_params][:email])
    return unless user

    return unless user.authenticate(args[:auth_params][:password])

    # generate user auth token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")

    OpenStruct.new({
      user: user,
      token: token
    })
  end

end
