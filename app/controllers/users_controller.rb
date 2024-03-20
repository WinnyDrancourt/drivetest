class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    sign_out(@user)
    redirect_to root_path, notice: 'Your account has been successfully deleted.'
  end

  private

  def set_user
    @user = current_user
  end

  def authorize_user!
    return if current_user == @user

    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :encrypted_password, :town)
  end
end
