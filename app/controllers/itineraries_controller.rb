class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:edit, :show]
  before_action :authenticate_user!, except: %i[index show]


  def index
    @itineraries = Itinerary.all.sort_by(&:count_likes).reverse
  end

  def edit
    unless @itinerary.user == current_user
      redirect_to root_path
    end
  end

  def show
    @coordinates = {}
      @itinerary.destinations.each_with_index do |destination, index|
        @coordinates[index] = get_coordinate(destination.city)
      end
    if user_signed_in?
      @like = current_user.likes.find_by(itinerary_id: @itinerary.id)
   
    end
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = @user.itineraries.build(itinerary_params)

    if params[:commit] == 'add_destination'
      @itinerary.build_destination
      render :new
    elsif @itinerary.save
      redirect_to @itinerary
    else
      render :new
    end
  end

  def update
    @itinerary = Itinerary.find(params[:id])

    if @itinerary.update(itinerary_params)
      redirect_to @itinerary, notice: 'Itinerary was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.user == current_user
      @itinerary.destinations.destroy_all
      @itinerary.destroy
      redirect_to itineraries_path
    else
      redirect_to root_path
    end  
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :start_date, :end_date,
                                      destinations_attributes: %i[id city notes staying_time _destroy]).tap do |attr|
      default_dates(attr)
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

  def default_dates(attr)
    attr[:start_date] ||= default_start_date
    attr[:end_date] ||= default_end_date(attr[:start_date], attr[:destinations_attributes])
  end

  def stay_count
    @stay = @itinerary.total_staying_time
  end

  def get_coordinate(city)
    result = Geocoder.search(city).first
    if result
      [result.latitude, result.longitude] 
    else
      [0.0, 0.0]
    end
  end
end
