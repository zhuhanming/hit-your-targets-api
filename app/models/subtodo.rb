class Subtodo < ApplicationRecord
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :title, :start_time, :end_time
  validates_inclusion_of :completed, :in => [true, false]
end
