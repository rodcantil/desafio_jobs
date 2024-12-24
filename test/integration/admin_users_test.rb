require "test_helper"
require "securerandom"

class AdminUsersTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = User.create!(
      name: "Admin User",
      image: "default.png",
      age: 30,
      phone: "1234567890",
      occupation: "Mecanico",
      year_exp: 5,
      email: "admin#{SecureRandom.hex(4)}@example.com",
      password: "password",
      password_confirmation: "password",
      role: "admin"
    )
    sign_in @admin
  end

  def teardown
    Capybara.reset_sessions! if Capybara.current_session.driver.browser.respond_to?(:reset!)
    Capybara.use_default_driver unless Capybara.current_driver == Capybara.default_driver
  end

  test "admin can access users index" do
    get users_path
    assert_response :success
    assert_select "h1", "Lista de Usuarios"
  end

  test "admin can register a new user" do
    get new_user_registration_path
    assert_response :success
    assert_select "form"

    post user_registration_path, params: {
      user: {
        name: "Nuevo Usuario",
        email: "nuevo#{SecureRandom.hex(4)}@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    follow_redirect!
    assert_response :success
    assert_select "p", "Usuario registrado exitosamente."
  end
end
