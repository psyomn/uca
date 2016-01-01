# General control of songs
# @author psyomn
class SongsController < ApplicationController
  load_and_authorize_resource

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @ratings = @song.ratings
    @band = @song.band
  end

  def destroy
  end
end
