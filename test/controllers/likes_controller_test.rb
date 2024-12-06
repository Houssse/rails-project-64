require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "create like" do
    post post_likes_path(@post)

    assert_equal 1, @post.post_likes.count

    assert_redirected_to post_path(@post)
  end

  test "destroy like" do
    @post.post_likes.create(user: @user)

    delete post_like_path(@post, @like)

    assert_equal 0, @post.post_likes.count
  end
end
