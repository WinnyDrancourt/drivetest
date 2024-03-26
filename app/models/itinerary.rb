class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :destinations, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  has_many :likes, dependent: :destroy

  after_initialize :build_default_destination

  def build_destination
    destinations.build
  end

  def build_default_destination
    destinations.build if new_record? && destinations.empty?
  end

  def total_staying_time
    destinations.sum(:staying_time)
  end

  def count_likes
    likes.count
  end
end
