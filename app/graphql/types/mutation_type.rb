module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser

    field :create_project, mutation: Mutations::CreateProject
    field :delete_project, mutation: Mutations::DeleteProject
    field :update_project, mutation: Mutations::UpdateProject

    field :create_task, mutation: Mutations::CreateTask
    field :delete_task, mutation: Mutations::DeleteTask
    field :update_task, mutation: Mutations::UpdateTask
  end
end
