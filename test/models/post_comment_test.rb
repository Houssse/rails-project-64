# frozen_string_literal: true

require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  test 'valid comment' do
    assert_predicate @comment, :valid?
  end

  test 'invalid comment' do
    @comment.content = ''

    assert_not @comment.valid?
  end
end
