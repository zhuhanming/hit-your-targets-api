class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model associations
  has_many :todos, dependent: :destroy
  # validations
  validates_presence_of :name, :email, :password_digest
end
