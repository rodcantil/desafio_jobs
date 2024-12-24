ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "capybara/rails"
require "capybara/minitest"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)
    self.use_transactional_tests = true
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    include Capybara::DSL
    # Make `assert_*` methods behave like Minitest assertions
    include Capybara::Minitest::Assertions
    # Add more helper methods to be used by all tests here...

    teardown do
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end
class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
