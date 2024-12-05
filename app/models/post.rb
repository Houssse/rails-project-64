class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
end
