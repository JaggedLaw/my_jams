require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "registered user can logout" do
    login_user
    click_link "Logout"

    assert page.has_content?("Come again!")
  end

  def login_user
    User.create(username: "Micky", password: "password")
    visit login_path
    fill_in "Username", with: "Micky"
    fill_in "Password", with: "password"
    click_button "Login"
  end


end
