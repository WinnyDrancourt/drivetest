class UsersController < ApplicationController
  def show; end

  private

  def set_user
    @user = current_user
  end

  # def authorize_user!
  #  return if current_user == @user

  #  redirect_to root_path
  # end
end
