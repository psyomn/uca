# Songs shouldn't be unique, but band names should be unique. This indirectly
# enforces uniqueness when identifying songs.
class Song < ActiveRecord::Base
  has_many :ratings
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
