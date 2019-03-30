require 'test_helper'
# Create unit test from ActiveSupport
# These test models and make individual units like validations work
class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    # Test validations
    assert @category.valid?
  end

  test "name should be present" do
    # Cannot be an empty string
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 30
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

end
