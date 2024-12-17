require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_post_url

    assert_response :success

    assert_select 'h1', 'Новый пост'
    assert_select 'label', 'Категория'
  end

  test 'create post' do
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { title: 'New Post', body: Faker::Lorem.paragraph_by_chars(number: 255), category_id: @category.id } }
    end

    assert_redirected_to post_path(Post.last)

    follow_redirect!

    assert_select 'h1', 'New Post'
  end

  test 'show post' do
    get post_url(@post)

    assert_response :success

    assert_select 'h1', @post.title
    assert_select 'p', @post.body
  end
end
