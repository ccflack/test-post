class User < ApplicationRecord
  has_many :posts
  has_many :votes
  has_many :comments
  has_secure_password
  validates :username, :email_address, presence: true,
                                       uniqueness: true

  def to_param
    username
  end

end
