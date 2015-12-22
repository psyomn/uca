class User < ActiveRecord::Base
  has_many :songs
  has_many :bands
  has_many :ratings

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

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :bio
  # attr_accessible :title, :body
end
