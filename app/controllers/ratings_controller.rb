class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    if @rating.save
    else
      flash[:alert] = "Could not save rating"
    end
  end

  def edit
    @rating = Rating.find(params.permit(:id)[:id])
    @song = @rating.song
  end

  def update
    @rating = Rating.find(params.permit(:id)[:id])
    if @rating.update(rating_params)
      redirect_to song_path(@rating.song)
    else
      flash[:alert] = "Problem updating rating."
      redirect_to edit_rating_path(@rating)
    end
  end

  def destroy
  end

  private

    def rating_params
      params.require(:rating).permit(:score, :comment)
    end
end
