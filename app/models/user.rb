class User < ApplicationRecord
  before_save { email.downcase!} #callback
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
					format: { with: VALID_EMAIL_REGEX },
					uniqueness:{ case_sensitive: false }
  #the following gives:
  # -ability to save a securely hashed password_digest attr. to database
  # -pair of virtual attr. (password and password_confirmation)
  # -an authenticate method that returns when the user password is correct
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
