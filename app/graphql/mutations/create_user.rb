module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    type Types::UserType

    def resolve(first_name: nil, last_name: nil, email: nil, password: nil)
      User.create!(
        email: email,
        password: password,
        first_name: first_name,
        last_name: last_name
      )
    end
  end
end
