module Mutations
  class DeleteTask < GraphQL::Schema::Mutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(id: nil)
      user = context[:current_user]

      return unless user

      project = user.projects.find(project_id)
      project.tasks.destroy(id)
    end
  end
end
