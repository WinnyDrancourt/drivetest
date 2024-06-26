# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params

  # GET /resource/sign_up
  # def new
  #  super
  # end

  # POST /resource
  # def create
  #  super
  # end
  def create
    @user = User.new(user_params)
    set_coordinates(@user)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[pseudo])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[last_name pseudo first_name zipcode city])
  end

  def set_coordinates(user)
    coordinates = Geocoder.coordinates("#{user.city}, #{user.zipcode}")
    return unless coordinates.present?

    user.latitude = coordinates[0]
    user.longitude = coordinates[1]
  end

  def user_params
    params.require(:user).permit(:first_name, :pseudo, :last_name, :city, :email, :password, :password_confirmation,
                                 :zipcode)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
