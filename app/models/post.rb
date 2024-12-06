class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :post_comments
  has_many :post_likes

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
end
