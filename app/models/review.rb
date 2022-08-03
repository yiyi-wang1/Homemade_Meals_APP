class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :rating, presence: true
end
