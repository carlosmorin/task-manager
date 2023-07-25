class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :tasks, if: -> { should_show_movies }

  def should_show_movies
    @instance_options[:show_movies]
  end
end
