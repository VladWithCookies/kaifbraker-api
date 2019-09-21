module Mutations
  class DeleteTask < GraphQL::Schema::Mutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(id: nil)
      user = context[:current_user]

      return unless user

      task = Task.find(id)

      return unless task.project.user_id == user.id

      task.destroy
    end
  end
end
