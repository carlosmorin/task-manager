class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :tasks, if: -> { should_show_tasks }

  def should_show_tasks
    @instance_options[:show_tasks]
  end
end
