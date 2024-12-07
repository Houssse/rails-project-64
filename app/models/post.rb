class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  validates :title, length: { minimum: 5, maximum: 255 }, presence: true
  validates :body, length: { minimum: 200, maximum: 4000 }, presence: true
  validates :category_id, presence: true
end
