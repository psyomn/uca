class Newsitem < ActiveRecord::Base
  # attr_accessible :body, :title
  belongs_to :user

  validates :user_id, presence: true
end
