require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "сreate like" do
    post post_likes_path(@post)

    assert_equal 1, @post.likes.count

    assert_redirected_to post_path(@post)
  end

  test "destroy like" do
    @post.likes.create

    delete post_like_path(@post, @like)

    assert_equal 0, @post.likes.count
  end

  test "destroyed by another user" do
    @post.likes.create
    sign_in @user_two

    delete post_like_path(@post, @like)

    assert_equal 1, @post.likes.count
  end
end
