class Idea < ApplicationRecord
  validates :name, uniqueness: true
end
