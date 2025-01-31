# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.2]
  def change
    create_table(:post_comments) do |t|
      t.string(:content, null: false)
      t.references(:user, null: false, foreign_key: true)
      t.references(:post, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
