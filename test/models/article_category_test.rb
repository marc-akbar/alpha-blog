require 'test_helper'
# Create unit test from ActiveSupport
# These test models and make individual units like validations work
class ArticleCategoryTest < ActiveSupport::TestCase

  def setup
    @articlecategory = ArticleCategory.new(article_id: 1, category_id: 2)
  end

  test "articlecategory should be valid" do
    assert @articlecategory.valid?
  end

end
