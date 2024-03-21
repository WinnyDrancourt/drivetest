class ItinerariesController < ApplicationController
  before_action :set_itinerary

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
    # @destination = @itinerary.destinations.build
  end

  def create

    @itinerary = @user.itineraries.build(itinerary_params)
    @current_etape = @itinerary.destinations.size + 1

    if params[:commit] == 'add_destination'
      @itinerary.build_destination_with_limit
      render :new
    elsif @itinerary.save
      redirect_to @itinerary
    else
      render :new
    end

  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destinations.destroy_all
    @itinerary.destroy
    redirect_to itineraries_path
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destinations_attributes: %i[id city notes staying_time _destroy])
  end
end
