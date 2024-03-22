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
    @end_date = @itinerary.end_date ? @itinerary.end_date.strftime('%d-%m-%Y') : 'Undefined'
  end

  def new
    @itinerary = Itinerary.new
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
                                      destinations_attributes: %i[id city notes staying_time _destroy]).tap do |attribute|
      set_default_dates(attribute)
    end
  end

  def default_start_date
    Date.today
  end

  def default_end_date(start_date, destinations_attributes)
    return start_date if destinations_attributes.blank?

    stay = destinations_attributes.values.sum { |dest| dest[:staying_time].to_i }
    start_date + stay.days
  end

  def set_default_dates(attribute)
    attribute[:start_date] ||= default_start_date
    attribute[:end_date] ||= default_end_date(attribute[:start_date], attribute[:destinations_attributes])
  end
end
