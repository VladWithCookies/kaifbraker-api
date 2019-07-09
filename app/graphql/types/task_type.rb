class Types::TaskType < Types::BaseObject
  field :id, ID, null: false
  field :done, Boolean, null: false
  field :content, String, null: false
  field :created_at, String, null: false
end
