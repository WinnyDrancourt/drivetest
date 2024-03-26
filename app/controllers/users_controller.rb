class UsersController < ApplicationController
  def show
    @user_likes = @user.likes.includes(:itinerary).where(user_id: @user.id)
    @other_user_likes = @user_likes.reject { |like| like.itinerary.user == @user }
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

  def index; end
end
