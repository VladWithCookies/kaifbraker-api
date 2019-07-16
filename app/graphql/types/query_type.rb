module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: true
    field :projects, [ProjectType], null: true

    field :project, ProjectType, null: true do
      argument :id, ID, required: true
    end

    def user
      current_user
    end

    def projects
      current_user&.projects
    end

    def project(id:)
      projects.find(id)
    end
  end
end
