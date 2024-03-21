class ItinerariesController < ApplicationController
  def index; end

  def show; end

  def new
    @itinerary = Itinerary.new
    @itinerary.destinations.build
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destination_attributes: %i[city notes staying_time])
  end
end
