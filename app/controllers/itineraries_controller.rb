class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show]

  def index
    @all_itineraries = Itinerary.all
  end

  def show
    if @itinerary.nil?
      flash[:alert] = "Itinerary doesn't exist yet!"
      redirect_to root_path
      return
    end

    # Setting start date if not set
    @start_date = @itinerary.start_date ? @itinerary.start_date.strftime('%d-%m-%Y') : Date.today.strftime('%d-%m-%Y')

    # Formatting end date
    @end_date = @itinerary.end_date ? @itinerary.end_date.strftime('%d-%m-%Y') : "Undefined"
  end

  def new
    @itinerary = Itinerary.new
    @destination = @itinerary.destinations.build
  end

  def create
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destinations_attributes: %i[id city notes staying_time])
  end
end
