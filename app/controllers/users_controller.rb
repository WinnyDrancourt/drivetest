class UsersController < ApplicationController

  def show
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

  def index
  end

end
