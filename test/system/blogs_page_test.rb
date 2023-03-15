require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

# class ActionDispatch::IntegrationTest
#   # Make the Capybara DSL available in all integration tests
#   include Capybara::DSL
#   # Make `assert_*` methods behave like Minitest assertions
#   include Capybara::Minitest::Assertions
#
#   # Reset sessions and driver between tests
#   teardown do
#     Capybara.reset_sessions!
#     Capybara.use_default_driver
#   end
# end
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # describe "blogs page", type: :feature do
  test "should render blogs page" do
    visit '/blogs/new'
    assert page.status_code == 200
  end
  # end
end