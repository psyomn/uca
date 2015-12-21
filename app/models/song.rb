class Song < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
  belongs_to :band
  attr_accessible :name

  def full_name
    "#{self.band.name} - #{self.name}"
  end
end
