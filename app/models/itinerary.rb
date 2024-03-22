class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :destinations, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  has_many :likes

  after_initialize :build_default_destination

  # if limit option is present and user has >= destination than that, returns false
  # else, build a new destination
  def build_destination_with_limit
    return false if destinations_limit_reached?

    destinations.build
  end

  def destinations_limit_reached?
    lmt = self.class.nested_attributes_options[:destinations][:limit]
    lmt.present? && destinations.size >= lmt
  end

  private

  def build_default_destination
    destinations.build if new_record? && destinations.empty?
  end
end
