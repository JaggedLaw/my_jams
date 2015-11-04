require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test "registered user can login" do
    login_user

    assert page.has_content?("Welcome, Micky")
  end

  def login_user
    User.create(username: "Micky", password: "password")
    visit login_path
    fill_in "Username", with: "Micky"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
