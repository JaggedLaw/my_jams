require 'test_helper'

class DefaultUserDoesNotSeeAdminCategoriesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'default user does not see admin categories index' do
    user = User.create( username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
