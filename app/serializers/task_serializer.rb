class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :created_at
end
