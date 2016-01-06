class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  ROLES = %i[admin moderator]
  MaxBandsAllowed = 10

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

  # You can create 10 new bands per year
  def band_registrations_left_in_year(year)
    MaxBandsAllowed - self.bands
                          .select { |el| el.created_at.year == year }
                          .count
  end

  def band_registrations_left_this_year
    band_registrations_left_in_year(Time.now.year)
  end

  private
end
