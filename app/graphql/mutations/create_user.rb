module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    type Types::UserType

    def resolve(first_name: nil, last_name: nil, email: nil, password: nil)
      user = User.new(
        email: email,
        password: password,
        first_name: first_name,
        last_name: last_name
      )

      if user.save
        { user: user }
      else
        GraphQL::ExecutionError.new(user.errors.full_messages.join(', '))
      end
    end
  end
end
