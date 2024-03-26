class LikesController < ApplicationController
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

  private

  def like_params
    params.require(:like).permit(:itinerary_id)
  end
end
