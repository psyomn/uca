class SubmissionsController < ApplicationController
  def index
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
    @submission.song = Song.new
    @bands = current_user.bands
  end

  def edit
  end

  def create
    @submission = current_user.submissions.build(submission_params)
    @submission.song.user = current_user

    if @submission.save
      redirect_to submission_path(@submission)
    else
      puts "#" * 14
      p @submission
      @song = @submission.song

      puts "#" * 14
      p @song
      render :new
    end
  end

  def destroy
  end

  def update
  end

  private

  def submission_params
    params.require(:submission).permit(:comment,
      song_attributes: [:id, :name, :powertab, :band_id, :description])
  end
end
