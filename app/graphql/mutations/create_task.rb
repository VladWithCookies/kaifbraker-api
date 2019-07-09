module Mutations
  class CreateTask < GraphQL::Schema::Mutation
    argument :content, String, required: true
    argument :project_id, String, required: true

    type Types::ProjectType

    def resolve(content: nil, project_id: nil)
      user = context[:current_user]

      return unless user

      project = user.projects.find(project_id)

      Task.create!(content: content, project: project)
    end
  end
end
