class Post < ApplicationRecord
  # default_scope { order(votes_count: :desc) }
  belongs_to :user
  belongs_to :category
  has_many :votes
  validates :url, uniqueness: true
  validates :user, :title, :url, presence: true
end
