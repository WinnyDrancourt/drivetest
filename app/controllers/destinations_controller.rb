class DestinationsController < ApplicationController
  before_action :set_destination, only: %i[edit update]
  before_action :redirect_to_root, only: :show
  before_action :authenticate_user!

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @destination = @itinerary.destinations.build
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @destination = @itinerary.destinations.build(destination_params)

    if @destination.save
      redirect_to itinerary_path(@destination.itinerary_id), notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def show
    # Not granting access to a destination page
    # Created method to redirect to home page if user decides to use urls to access page
  end

  def edit
    return if current_user

    redirect_to_root
  end

  def update
    if @destination.update(destination_params)
      redirect_to itinerary_path(@destination.itinerary_id), notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @itinerary_find = Itinerary.find(params[:itinerary_id])
    @destination_find = @itinerary_find.destinations.find(params[:id])
    @destination_find.destroy
    redirect_to @itinerary_find, notice: 'Destination was successfully updated.'
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:city, :notes, :staying_time)
  end

  def redirect_to_root
    flash[:alert] = "You can't access this page"
    redirect_to root_path
  end
end
