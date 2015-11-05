require 'test_helper'

class UserSeesOnlySongsAssociatedWithTheirAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'user sees only songs associated that they added' do
    user = User.create( username: "default_user",
                        password: "password",
                        role: 0)

                        
  end
end
