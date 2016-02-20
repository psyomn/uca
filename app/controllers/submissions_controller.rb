class SubmissionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @submission = Submission.new
    @song = Song.new
  end

  def edit
  end

  def create
    @submission = current_user.submissions.build(submission_params)

    if @submission.save
      redirect_to @submission
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
    params.require(:submission).permit(:comment, song_attributes: [:id, :name, :powertab])
  end
end
