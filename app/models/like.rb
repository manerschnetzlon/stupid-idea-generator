class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea, counter_cache: :likes_count
  validates :user, uniqueness: { scope: :idea, message: "already liked" }
end
