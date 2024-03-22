class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :itineraries_count

  def set_user
    if params[:id].present?
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "User doesn't exist... yet!"
        redirect_to root_path
      end
    else
      @user = current_user
    end
  end

  def itineraries_count
    @iti_count = Itinerary.all.size
  end

  def itineraries_count
    @iti_count = Itinerary.all.size
  end
end
