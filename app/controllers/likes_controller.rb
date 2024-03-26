class LikesController < ApplicationController
  before_action :redirect_to_root, only: :show
  def create
    @like = @user.likes.new(like_params)
    flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
    redirect_to @like.itinerary
  end

  def destroy
    @like = @user.likes.find_by(id: params[:id])

    if @like.nil?
      flash[:alert] = 'Like not found.'
    else
      @like.destroy
      flash[:notice] = 'Like destroyed successfully.'
    end

    redirect_back(fallback_location: root_path)
  end

  def show
    #Not granting access to a like page
    #Created method to redirect to home page if user decides to use urls to access page
  end


  private

  def like_params
    params.require(:like).permit(:itinerary_id)
  end

  def redirect_to_root
    flash[:alert] = "You can't access this page"
    redirect_to root_path
  end

end
