# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: 'admin@localhost',
  password: 'thesecretpassword',
  password_confirmation: 'thesecretpassword')

case Rails.env
when "production"

when "development"
  ultraviolent = User.create(
    email: 'ultraviolentbandleader@violent.vio',
    password: 'ultraviolentpass',
    password_confirmation: 'ultraviolentpass')

  critic = User.create(
    email: 'critic@critic',
    password: 'testtesttest',
    password_confirmation: 'testtesttest')

  band = Band.where(name: "ULTRAVIOLENT").first_or_create
  ultraviolent.bands << band

  song1 = Song.where(name: "The color of your eyes", 
                     description: 'We wrote this when we were mesmerized by your eyes').first_or_create

  song2 = Song.where(name: "I love you",
                     description: 'We wrote this when we fell in love with you').first_or_create

  song3 = Song.where(name: "Yet another love song",
                    description: 'We wrote yet another love song because of things.').first_or_create

  [song1, song2, song3].each do |song|
    ultraviolent.songs << song
    band.songs << song
  end

  Newsitem.where(title: 'this is a test title!',
                body: 'There will be a lot of text in these things. A lot of news will be ' \
                'added here in the future. For now enjoy this short blurb!').first_or_create

  Newsitem.where(title: 'great news',
                 body: 'development of the new UCA site is not going bad at all! You might ' \
                 'be seeing new features implemented very shortly!').first_or_create
end
