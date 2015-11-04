require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test "guest can create account" do
    visit new_user_path

    fill_in "Username", with: "Ms. Jackson"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Ms. Jackson")
  end
end
