require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "test create root comment" do
    assert_difference "PostComment.count", 1 do
      post post_comments_path(@post), params: { post_comment: { content: "Comment body", parent: nil } }
    end

    assert_redirected_to post_path(@post)
    follow_redirect!
    assert_select "p", "Comment body"
  end

  test "test create child comment" do
    assert_difference "PostComment.count", 1 do
      post post_comments_path(@post), params: { post_comment: { content: "Child comment body", parent: @comment_root } }
    end

    assert_redirected_to post_path(@post)
    follow_redirect!
    assert_select "p", "Child comment body"
  end
end
