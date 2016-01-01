class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  Max = 5

  # attr_accessible :score
  private
    def rating_params
      params.require(:rating).permit(:score)
    end
end
