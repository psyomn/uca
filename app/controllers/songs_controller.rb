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

  def update
    raise NotImplementedError
  end

  def edit
    raise NotImplementedError
  end

  def new
    raise NotImplementedError
  end

  def create
    raise NotImplementedError
  end
end
