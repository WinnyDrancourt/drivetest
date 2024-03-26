class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :itinerary_id }
  belongs_to :user
  belongs_to :itinerary
end
