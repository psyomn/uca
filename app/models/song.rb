class Song < ActiveRecord::Base
  around_save :check_unique_on_band

  has_many :ratings
  belongs_to :user
  belongs_to :band
  # attr_accessible :name

  validates :user_id, presence: true
  validates :band_id, presence: true


  def full_name
    "#{self.band.name} - #{self.name}"
  end

  private

  # TODO: maybe there's a better way to express this...
  def check_unique_on_band
    include Errors
    names = self.band
        .songs
        .select(:name)
        .collect(&:name)

    if names.include? self.name
      raise Errors::IllegalRecord
    end

    # If above doesn't throw exception, we continue to save
    yield
  end
end
