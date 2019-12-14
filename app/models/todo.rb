class Todo < ApplicationRecord
  # model association
  has_many :subtodos, dependent: :destroy
  belongs_to :user

  #validations
  validates_presence_of :title, :description, :start_time, :end_time
  validates_inclusion_of :completed, :in => [true, false]
end
