module Mutations
  class UpdateTask < GraphQL::Schema::Mutation
    argument :id, ID, required: true
    argument :done, Boolean, required: true

    type Types::TaskType

    def resolve(id: nil, done: nil)
      user = context[:current_user]

      return unless user

      task = Task.find(id)

      return unless task.project.user_id == user.id

      task.update!(done: done)
      task
    end
  end
end
