class User < ApplicationRecord
  # Comment info in articles model
  has_many :articles, dependent: :destroy
  # Downcases any input in the email field for storage
  before_save { self.email = email.downcase }
  validates :username, presence: true,
            # Validates the uniqueness of each username
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  # Validates the email is in email format (something@company.someTLD)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  # Built in validation for password thorugh Bcrypt
  has_secure_password
end
