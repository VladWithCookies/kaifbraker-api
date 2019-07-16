class Types::ProjectType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :description, String, null: false
  field :deadline, String, null: false
  field :public, Boolean, null: false
  field :created_at, String, null: false

  field :tasks, [Types::TaskType], null: true
end
