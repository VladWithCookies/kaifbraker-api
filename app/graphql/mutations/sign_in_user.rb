module Mutations
  class SignInUser < GraphQL::Schema::Mutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil, password: nil)
      user = User.find_by_email(email)

      return unless user&.authenticate(password)

      token = JsonWebToken.encode(user_id: user.id)

      { user: user, token: token }
    end
  end
end
