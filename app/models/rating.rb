class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  Max = 5

  validates :score, inclusion: {
    in: 1..5,
    message: "enter a rating between 1 to #{Max}" }

  validates :user_id, presence: true
  validates :song_id, presence: true

  # Each user can have one rating for one song.
  validates :user_id, uniqueness: { scope: :song_id }

  # attr_accessible :score
  private
    def rating_params
      params.require(:rating).permit(:score)
    end
end
