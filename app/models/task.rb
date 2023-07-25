class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :category

end
