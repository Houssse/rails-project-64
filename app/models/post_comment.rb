class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_ancestry
end
