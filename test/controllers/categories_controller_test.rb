# test_helper is built in class to help run test and write additional methods
require 'test_helper'
# Create functional test from ActionDispatch
# These test controllers make sure a function is working
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # Initializations
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "john", email: "john@example.com",
                        password: "password", admin: true)
  end

  # Test defining what the test should do
  test "should get categories index" do
    # Get request from categories_path
    get categories_path
    # Should return the path successfully
    assert_response :success
  end

  test "should get new" do
    # sign_in defined in test_helper
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    # Should not show a difference in Category.count
    assert_no_difference 'Category.count' do
      # when trying to create new category as not admin
      post categories_path, params: { category: {name: "sports"} }
    end
    # Should redirect to categories_path
    assert_redirected_to categories_path
  end

end
