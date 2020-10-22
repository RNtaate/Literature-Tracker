class Group < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image

  has_many :book_groups
end
