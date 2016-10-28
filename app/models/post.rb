class Post < ApplicationRecord
  default_scope { order(vote_count: :desc) }
  belongs_to :user
end
