class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :description, presence: true

  #has_many :ingredients, dependent: :destroy
end
