class Article < ApplicationRecord
  # Creating this class gives us getters and setters for each column
  # in the table we created with migrate

  # Want to validate that the article is not empty and that it is within
  # a certain character restriction.
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  # When trying to create new article withhout title a rollback transaction
  # error will occur during article.save
end
