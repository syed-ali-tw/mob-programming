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

  #  describe "blogs page", type: :feature do TODO use rspec DSL
  test "should render blogs page" do
    visit '/blogs/new'
    assert page.status_code == 200
  end

  test "should create new blog and render on blog screen" do
    visit "/blogs/new"
    title = 'title for test'
    description = "description for the test"

    page.fill_in 'Title', with: title #https://www.rubydoc.info/gems/capybara/Capybara%2FNode%2FActions:fill_in  <refer this doc to understand how we are using >

    page.fill_in 'Description', with: description
    page.click_button 'Submit'
    assert find(:xpath, "//div[text()='Saved the record successfully']") #TODO - improve this assertion semantically - assert on alert being displayed
    assert page.current_path == "/" #TODO - possibly change the redirection destination to "/blogs"
    visit "/blogs"
    assert find(:xpath, "//td[text()='#{title}']")
    assert find(:xpath, "//td[text()='#{description}']")
  end

  test "should navigate to edit page after clicking the edit blog link" do
    skip
    visit "/blogs"
    page.click_link 'Edit Blog'
  end

end