require "test_helper"
require "securerandom"

class PostulationsControllersTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = User.create!(
      name: "Test User",
      email: "user#{SecureRandom.hex(4)}@example.com",
      password: "password",
      password_confirmation: "password"
    )
    sign_in @user

    @postulation = Postulation.create!(
      title: "Test Postulation",
      description: "This is a test postulation.",
      user: @user
    )
  end

  def teardown
    Capybara.reset_sessions! if Capybara.current_session.driver.browser.respond_to?(:reset!)
    Capybara.use_default_driver unless Capybara.current_driver == Capybara.default_driver
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end

  test "should get postulation" do
    get postulation_path(@postulation)
    assert_response :success
    assert_select "h1", @postulation.title
  end
end
