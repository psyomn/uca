class RatingsController < ApplicationController
  def new
    # Make sure that one user can only create one rating for a specific song.
    @rating = Rating.new
  end

  def create
    if @rating.save
    else
      flash[:alert] = "Could not save rating"
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @song = @rating.song
    @band = @song.band
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to song_path(@rating.song)
    else
      flash[:alert] = "Problem updating rating."
      @song = @rating.song
      @band = @song.band
      render :edit
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @song = @rating.song
    @rating.destroy
    redirect_to @song
  end

  private

    def rating_params
      params.require(:rating).permit(:score, :comment)
    end
end
