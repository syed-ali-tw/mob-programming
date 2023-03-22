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
    visit "/blogs"
    within_table_row(1) do
      click_on "Edit Blog"
    end
    puts page.current_path
    assert has_current_path? "/blogs/298486374/edit"
    # assert find('h1.title').text == 'Edit Blog'
    assert_text('Edit Blog')
  end

  def within_table_row(position)
    row = find_all("table tr")[position]
    within(row) do
      yield
    end
  end

end