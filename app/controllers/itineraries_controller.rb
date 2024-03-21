class ItinerariesController < ApplicationController
  def index
    @all_itineraries = Itinerary.all
  end

  def show
    # Setting start date if not set
    @itinerary = Itinerary.find(params[:id])
    @start_date = if @itinerary.start_date.nil?
                    Date.today.strftime('%d-%m-%Y')
                  else
                    @itinerary.start_date.strftime('%d-%m-%Y')
                  end

    # Formatting end date
    @end_date = if @itinerary.end_date.nil?
                  'Undefined'
                else
                  @itinerary.end_date.strftime('%d-%m-%Y')
                end
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

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destinations_attributes: %i[id city notes staying_time _destroy])
  end
end
