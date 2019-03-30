require 'test_helper'
# Integration tests also come from ActionDispatch
# These test full features, start to finish of business process
class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    # Should show category link to category page, with link name being category.name
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end
