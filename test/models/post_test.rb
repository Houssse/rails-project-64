require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    assert @post.valid?
  end

  test 'invalid post without title' do
    @post.title = ''
    assert_not @post.valid?
  end

  test 'invalid post without body' do
    @post.body = ''
    assert_not @post.valid?
  end

  test 'invalid post without category' do
    @post.category = nil
    assert_not @post.valid?
  end
end
