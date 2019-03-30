require 'test_helper'
# Integration tests also come from ActionDispatch
# These test full features, start to finish of business process
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com",
                        password: "password", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    # Should render template for new category
    assert_template 'categories/new'
    # Should be a difference in Category count by 1
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: "sports"} }
      # Redirects to appropriate path
      follow_redirect!
    end
    # appropriate path should be index
    assert_template 'categories/index'
    # End path shoudl contain new category
    assert_match "sports", response.body
  end

  test "invalid category submission result in failure" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name: " "} }
    end
    # Should render categories/new again
    assert_template 'categories/new'
    # Should render errors partial
    # Looks for title and body of erroes partial
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
