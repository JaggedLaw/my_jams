require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'logged in admin sees categories index' do
    admin = User.create(  username: "admin",
                          password: "password",
                          role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end

end
