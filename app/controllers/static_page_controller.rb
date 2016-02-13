# Anything static goes here
# @author psyomn
class StaticPageController < ApplicationController
  def home
    @songs = Song.order('created_at desc').last(10)
    @ratings = Rating.last(10)

    @newsitems = Newsitem.select(:id, :title, :created_at).last(10)
    if @newsitems.count > 0
      @first_newsitem = Newsitem.find_by_id(@newsitems.shift.id)
    else
      @first_newsitem = nil
    end
  end

  def about
  end
end
