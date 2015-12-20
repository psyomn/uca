class Band < ActiveRecord::Base
  has_many :songs
  belongs_to :user
  attr_accessible :name
end
