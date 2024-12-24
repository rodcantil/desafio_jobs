require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = User.create!(
      name: "Test User",
      email: "test_user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    @new_user_email = "new_user#{SecureRandom.hex(4)}@example.com"
  end

  def teardown
    Capybara.reset_sessions! if Capybara.current_session.driver.browser.respond_to?(:reset!)
    Capybara.use_default_driver unless Capybara.current_driver == Capybara.default_driver
  end

  test "should get new registration" do
    get new_user_registration_path
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post user_registration_path, params: {
        user: {
          name: "New User",
          email: @new_user_email,
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    follow_redirect!
    assert_response :success
    assert_text "Bienvenido! Te has registrado exitosamente."
  end

  test "should update user" do
    sign_in @user
    put user_registration_path, params: {
      user: {
        name: "Updated User",
        email: @user.email,
        current_password: "password",
        password: "newpassword",
        password_confirmation: "newpassword"
      }
    }
    follow_redirect!
    assert_response :success
    assert_text "Tu cuenta ha sido actualizada exitosamente."
  end

  test "should destroy user" do
    sign_in @user
    assert_difference("User.count", -1) do
      delete user_registration_path
    end
    follow_redirect!
    assert_response :success
    assert_text "Tu cuenta ha sido eliminada correctamente."
  end
end
