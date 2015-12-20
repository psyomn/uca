class Song < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
  belongs_to :band
  attr_accessible :name
end
