class Post < ApplicationRecord
  default_scope { order(vote_count: :desc) }
  belongs_to :user
  belongs_to :category
  validates :url, uniqueness: true
end
