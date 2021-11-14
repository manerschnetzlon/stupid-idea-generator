class Idea < ApplicationRecord
  belongs_to :owner, foreign_key: :user_id, optional: true
  validates :name, uniqueness: true
end
