class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :groups, dependent: :destroy
  
  has_many :books, foreign_key: :author_id, dependent: :destroy

  has_one_attached :image, dependent: :destroy

  validates :image, content_type: {in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'must be (png, jpg or jpeg)'}

  validates :image, size: {less_than: 5.megabytes, message: 'must be less than 5 MB'}
end
