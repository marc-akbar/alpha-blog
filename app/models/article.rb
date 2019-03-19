class Article < ApplicationRecord
  # Creating this class gives us getters and setters for each column
  # in the table we created with migrate
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
