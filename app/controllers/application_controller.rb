class ApplicationController < ActionController::Base
  before_action :set_user

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
end
