class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address' }
  validates :password, length: { minimum: 6, maximum: 20 }

  has_many :recipes, dependent: :destroy
end
