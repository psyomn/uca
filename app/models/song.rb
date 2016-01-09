# Songs shouldn't be unique, but band names should be unique. This indirectly
# enforces uniqueness when identifying songs.
class Song < ActiveRecord::Base
  # TODO: should we retaing ratings on deleted songs? What if users put a lot of
  # effort writing a rating on a song?
  has_many :ratings, dependent: :destroy

  belongs_to :user
  belongs_to :band
  # attr_accessible :name

  validates :user_id, presence: true
  validates :band_id, presence: true

  def full_name
    "#{self.band.name} - #{self.name}"
  end

  private
end
