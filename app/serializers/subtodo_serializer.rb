class SubtodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_time, :end_time, :completed, :created_at, :updated_at
  belongs_to :todo
end
