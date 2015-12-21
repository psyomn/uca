require 'rails_helper'

RSpec.describe Song, :type => :model do

  # TODO: in the future these should be changed to something else (before all,
  # after all). Check this guy:
  #
  #   http://renderedtext.com/blog/2012/10/10/cleaning-up-after-before-all-blocks/
  #

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    @user = default_user
    @user.save!
    @band_uv = Band.new(name: 'ultraviolent')
    @band_uv.user = @user
    @band_tt = Band.new(name: 'teetee')
    @band_tt.user = @user
    [@band_uv, @band_tt].map { |e| e.save! }
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  it 'should allow the same name of a song with different bands' do
    name = 'i love love u'

    song = Song.new(name: name)
    song.user = @user
    song.band = @band_uv
    song.save!

    song = Song.new(name: name)
    song.user = @user
    song.band = @band_tt
    expect{song.save!}.to_not raise_error
  end

  it 'should not allow same band names, and same song name' do
    name = 'i love love u'

    song = Song.new(name: name)
    song.user = @user
    song.band = @band_uv
    song.save!

    song = Song.new(name: name)
    song.user = @user
    song.band = @band_uv
    expect{song.save!}.to raise_error(Errors::IllegalRecord)
  end

end
