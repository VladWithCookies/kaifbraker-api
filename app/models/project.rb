class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :title, :deadline, presence: true
end
