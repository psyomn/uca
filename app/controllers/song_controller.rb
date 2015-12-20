# General control of songs
# @author psyomn
class SongController < ApplicationController
  def index
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
  end
end
