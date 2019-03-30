require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase

  def setup
    @articlecategory = ArticleCategory.new(article_id: 1, category_id: 2)
  end

  test "articlecategory should be valid" do
    assert @articlecategory.valid?
  end

end
