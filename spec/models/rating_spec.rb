require 'rails_helper'

RSpec.describe Rating, :type => :model do
  it 'should not allow multiple ratings for one song, by one unique user'

  it 'should not allow a user to rate their own song'
end
