# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test 'сreate like' do
    post post_likes_path(@post)

    assert_equal 1, @post.likes.count

    assert_redirected_to post_path(@post)
  end

  test 'delete post like' do
    delete post_like_url(posts(:one).id, post_likes(:one).id)

    assert_response :redirect

    deleted_post_like = PostLike.find_by(id: post_likes(:one).id)

    assert_nil(deleted_post_like, 'Post like should be deleted')
  end

  test 'destroyed by another user' do
    @post.likes.create
    sign_in @user_two

    delete post_like_path(@post, @like)

    assert_equal 1, @post.likes.count
  end
end
