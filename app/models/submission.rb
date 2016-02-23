class Submission < ActiveRecord::Base
  has_many :submission_comments
  belongs_to :song, inverse_of: :submission
  belongs_to :user
  accepts_nested_attributes_for :song

  validates :user_id, presence: true
  validates_associated :user, :song
end
