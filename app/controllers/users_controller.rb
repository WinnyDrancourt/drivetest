class UsersController < ApplicationController
  def show
    if params[:id].present?
      begin
        @city = User.find(params[:id]).city
        @coordinates = get_coordinate(@city)
        @user = User.find(params[:id])
        @user_likes = @user.likes.includes(:itinerary).where(user_id: @user.id)
        @other_user_likes = @user_likes.reject { |like| like.itinerary.user == @user }
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "User doesn't exist... yet!"
        redirect_to root_path
      end
    else
      @user = current_user
    end
  end

  def index; end

  private

  def get_coordinate(city)
    result = Geocoder.search(city).first
    return unless result

    [result.latitude, result.longitude]
  end
end
