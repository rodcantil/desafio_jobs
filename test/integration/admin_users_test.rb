require "test_helper"

class AdminUsersTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    @admin = FactoryBot.create(:user, :admin)
    login_as(@admin, scope: :user)
  end

  test "admin can access users index" do
    visit users_path
    assert_text "Lista de Usuarios"
  end

  test "admin can register a new user" do
    visit new_user_registration_path
    fill_in "Name", with: "Nuevo Usuario"
    fill_in "Email", with: "nuevo@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Registrar"
    assert_text "Usuario registrado exitosamente."
  end
end
