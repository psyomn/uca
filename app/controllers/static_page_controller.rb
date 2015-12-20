# Anything static goes here
# @author psyomn
class StaticPageController < ApplicationController
  def home
    @songs = Song.order('created_at desc').last(10)
    @ratings = Rating.last(10)
    @newsitems = Newsitem.all
  end

  def about
  end
end
