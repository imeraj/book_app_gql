Types::AuthProviderInputType = GraphQL::InputObjectType.define do
  name 'AuthProviderInput'
  argument :email, !types.String
  argument :password, !types.String
end
