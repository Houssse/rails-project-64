class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :neme, presence: true
end
