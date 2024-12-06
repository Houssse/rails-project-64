ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    include Devise::Test::IntegrationHelpers

    def setup
      user = users(:one)
      sign_in user
      @category = categories(:one)
      @post = posts(:one)
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
