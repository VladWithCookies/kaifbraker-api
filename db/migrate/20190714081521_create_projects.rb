class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.string :deadline, null: false, default: ''
      t.boolean :public, null: false, default: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
