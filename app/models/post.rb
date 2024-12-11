class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :comments, class_name: "PostComment", dependent: :destroy
  has_many :likes, class_name: "PostLike", dependent: :destroy

  validates :title, length: { minimum: 5, maximum: 255 }, presence: true
  validates :body, length: { minimum: 200, maximum: 4000 }, presence: true
end
