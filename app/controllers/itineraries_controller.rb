class ItinerariesController < ApplicationController
  def index; end

  def show
    #Setting start date if not set
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.start_date.nil?
      @start_date = Date.today.strftime('%d-%m-%Y') 
    else
     @start_date = @itinerary.start_date.strftime('%d-%m-%Y') 
    end

    #Formatting end date
    if @itinerary.end_date.nil?
      @end_date = "Undefined"
    else
      @end_date = @itinerary.end_date.strftime('%d-%m-%Y') 
    end
  end

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
