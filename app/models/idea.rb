class Idea < ApplicationRecord
  belongs_to :owner, foreign_key: :user_id, optional: true
  has_many :likes, dependent: :destroy
  validates :name, uniqueness: true

  def liked?(user)
    Like.exists?(user: user, idea: self)
  end
end
