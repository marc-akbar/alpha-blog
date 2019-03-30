class ArticleCategory < ApplicationRecord
  # Comment info in articles model
  belongs_to :article
  belongs_to :category
end
