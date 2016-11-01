class User < ApplicationRecord
  has_many :posts
  has_many :votes
  has_secure_password
  validates :username, :email_address, presence: true, uniqueness: true
end
