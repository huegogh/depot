require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # Assert selects uses CSS selectors to find elemements on page
    # The first one searches for an 'a' tag nested in a nav tag that has the class 'side_nav'
    # and has a qty of 4 for those 'a' tags
    assert_select 'nav.side_nav a', minimum: 4
    # Assert selects perform a search based on the second parameter.
    # If it's a number, it looks for qty; if it's a string it looks to match that string
    assert_select 'main ul.catalog li', 3
    assert_select 'h2', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end
