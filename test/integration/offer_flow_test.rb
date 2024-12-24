require "test_helper"
require "securerandom"

class OfferFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = User.create!(
      name: "Test User",
      email: "user#{SecureRandom.hex(4)}@example.com",
      password: "password",
      password_confirmation: "password"
    )
    sign_in @user

    @offer = Offer.create!(
      title: "Test Offer",
      description: "This is a test offer.",
      user: @user
    )
  end

  def teardown
    Capybara.reset_sessions! if Capybara.current_session.driver.browser.respond_to?(:reset!)
    Capybara.use_default_driver unless Capybara.current_driver == Capybara.default_driver
  end

  test "user can view offers index" do
    visit offers_path
    assert_response :success
    assert_select "h1", "Lista de Ofertas"
    assert_text @offer.title
  end

  test "user can view an offer's show page" do
    visit offer_path(@offer)
    assert_response :success
    assert_select "h1", @offer.title
    assert_text @offer.description
  end
end
