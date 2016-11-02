class Vote < ApplicationRecord
  belongs_to :post, counter_cache: :votes_count
  belongs_to :user
end
