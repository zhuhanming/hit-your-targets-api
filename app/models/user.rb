class User < ApplicationRecord
  include Storext.model
  # encrypt password
  has_secure_password

  # model associations
  has_many :todos, dependent: :destroy
  # validations
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email

  # user preferences storext
  store_attributes :preferences do
    clear_task_on_change Boolean, default: true
    include_completed_in_all Boolean, default: false
    follow_kanban_subtask_order Boolean, default: false
  end
end
