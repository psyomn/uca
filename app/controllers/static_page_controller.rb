# Anything static goes here
# @author psyomn
class StaticPageController < ApplicationController
  def home
    @songs = Song.order('created_at desc').last(10)
    @ratings = Rating.last(10)
    @newsitems = Newsitem.select(:id, :title, :created_at).last(10).to_a
    @first_newsitem = Newsitem.find(@newsitems.shift.id)
  end

  def about
  end
end
