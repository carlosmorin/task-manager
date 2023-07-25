class Category < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  validates :name, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :tasks, allow_destroy: true
end
