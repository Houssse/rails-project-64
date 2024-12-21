# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_post_url

    assert_response :success

    assert_select 'h1', 'Новый пост'
    assert_select 'label', 'Категория'
  end

  test 'create post' do
    post posts_url,
         params: { post: { title: 'New Post', body: Faker::Lorem.paragraph_by_chars(number: 255),
                           category_id: @category.id } }

    assert_response :redirect

    created_post = Post.find_by(title: 'New Post')

    assert(created_post, 'Post should be created')
    assert_predicate created_post, :persisted?
  end

  test 'create valid post' do
    title = 'New Post'
    body = Faker::Lorem.paragraph_by_chars(number: 255)

    new_post = {
      title: title,
      body: body,
      category_id: @category.id
    }
    post posts_url, params: { post: new_post }

    created_post = Post.find_by(title: title)

    new_post.each do |key, value|
      assert_equal value, created_post.send(key), "Attribute #{key} does not match"
    end
  end

  test 'show post' do
    get post_url(@post)

    assert_response :success

    assert_select 'h1', @post.title
    assert_select 'p', @post.body
  end
end
