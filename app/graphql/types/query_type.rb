module Types
  class QueryType < Types::BaseObject
    field :projects, [ProjectType], null: true

    field :project, ProjectType, null: true do
      argument :id, ID, required: true
    end

    def projects
      current_user&.projects
    end

    def project(id:)
      projects&.find(id)
    end

    private

    def current_user
      context[:current_user]
    end
  end
end
