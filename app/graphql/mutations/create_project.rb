module Mutations
  class CreateProject < GraphQL::Schema::Mutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :deadline, String, required: true
    argument :public, Boolean, required: true

    type Types::ProjectType

    def resolve(title: nil, description: nil, deadline: nil, public: nil)
      user = context[:current_user]

      return unless user

      Project.create!(
        title: title,
        description: description,
        deadline: deadline,
        public: public,
        user: user
      )
    end
  end
end
