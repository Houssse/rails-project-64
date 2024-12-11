class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
