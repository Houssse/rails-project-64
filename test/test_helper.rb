# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    include Devise::Test::IntegrationHelpers

    def setup
      @user_one = users(:one)
      @user_two = users(:two)
      sign_in(@user_one)
      @category = categories(:one)
      @post = posts(:one)
      @comment = PostComment.new(content: 'This is a valid comment', user: users(:one), post: posts(:one))
      @comment_root = post_comments(:one)
      @comment_child = post_comments(:two)
      @like = post_likes(:one)
    end

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
