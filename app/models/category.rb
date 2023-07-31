class Category < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  validates :name, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :tasks, allow_destroy: true

  scope :ordering, ->(order) { order(created_at: order.to_sym) }
  scope :filter_by_name, ->(query) { where("name LIKE ?", "%#{query}%") }
end
