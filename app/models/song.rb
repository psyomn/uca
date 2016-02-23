# Songs shouldn't be unique, but band names should be unique. This indirectly
# enforces uniqueness when identifying songs.
class Song < ActiveRecord::Base
  MagicGz = "\x1f8b"
  # TODO: should we retaing ratings on deleted songs? What if users put a lot of
  # effort writing a rating on a song?
  has_many :ratings, dependent: :destroy

  mount_uploader :powertab, PowertabUploader

  belongs_to :user
  belongs_to :band
  has_one :submission
  # attr_accessible :name

  validates :user_id, presence: true
  validates :band_id, presence: true

  after_initialize :defaults

  def full_name
    "#{self.band.name} - #{self.name}"
  end

  # state_machine :song, :initial => :supervised do
  #   after_transition :on => :accept, do: :mark_accepted
  #   event :accept do
  #     transition :supervised => :accepted
  #   end
  # end

  private

  def mark_accepted
    self.status = 'accepted'
    self.save
  end

  def defaults
    self.status = 'new'
  end
end
