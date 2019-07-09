class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy

  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }
end
