class Band < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  belongs_to :user
  # attr_accessible :name

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

end
