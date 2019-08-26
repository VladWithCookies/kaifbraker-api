module Mutations
  class DeleteProject < GraphQL::Schema::Mutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(id: nil)
      user = context[:current_user]

      return unless user

      project = user.projects.find(id)
      project.destroy
      project
    end
  end
end
