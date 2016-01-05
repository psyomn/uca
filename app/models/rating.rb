class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  Max = 5

  validates :score, inclusion: 1..5
  validates :user_id, presence: true
  validates :song_id, presence: true

  # attr_accessible :score
  private
    def rating_params
      params.require(:rating).permit(:score)
    end
end
