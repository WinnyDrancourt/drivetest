class ApplicationController < ActionController::Base
  before_action :set_user, :set_itinerary, :itineraries_count # , :stay_count

  def set_user
    @user = current_user
  end

  def itineraries_count
    @iti_count = Itinerary.all.size
  end

  def set_itinerary
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  # def stay_count
  # @stay = @itinerary.destinations.values.sum { |dest| dest[:staying_time].to_i }
  # end
end
