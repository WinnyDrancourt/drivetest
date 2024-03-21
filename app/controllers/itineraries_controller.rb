class ItinerariesController < ApplicationController
  def index; end

  def show; end

  def new
    @itinerary = Itinerary.new
    @destination = @itinerary.destinations.build
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to @itinerary
    else
      flash.now[:alert] = 'Failed to create itinerary: ' + @itinerary.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destinations_attributes: %i[id city notes staying_time])
  end
end
