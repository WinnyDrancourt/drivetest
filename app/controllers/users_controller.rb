class UsersController < ApplicationController
  before_action :set_user, only [:show]
  def show
  end

  def index
  end

  private

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

  # def authorize_user!
  #  return if current_user == @user

  #  redirect_to root_path
  # end
end
