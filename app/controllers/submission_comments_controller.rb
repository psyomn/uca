class SubmissionCommentsController < ApplicationController

  # POST
  def create
    sc = SubmissionComment.new(submission_comments_params(params))
    sc.user = current_user
    sc.save

    render json: sc
  end

  private

  def submission_comments_params(params)
    params.permit(:comment, :vote_type, :submission_id)
  end
end
