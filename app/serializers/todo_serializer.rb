class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_time, :end_time, :completed, :created_at, :updated_at, :complete_time, :tags
  has_many :subtodos
end
