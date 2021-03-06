class Newsitem < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user

  validates :user_id, presence: true
end
