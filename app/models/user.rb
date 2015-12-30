class User < ActiveRecord::Base
  ROLES = %i[admin moderator]
  has_many :songs
  has_many :bands
  has_many :ratings

  # Nicknames should be at least unique
  validates :nickname, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Returns the best name possible; in order of preference:
  # * nickname
  # * real_name
  # * generated username with id
  def best_name_possible
    nickname || real_name || "user_#{id}"
  end

  def has_role?(check_role)
    return false if !self.role
    self.role.to_sym == check_role
  end

  private
end
