class BandsController < ApplicationController
  before_filter :letter_list, only: [:letter, :show, :index]
  def index
    @bands = Band.all
  end

  def letter
  end

  def show
    @band = Band.find(params[:id])
    @band_leader = @band.user
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def band_params
      params.require(:band).permit(:id)
    end

    def letter_list
      # TODO this might need optimization
      @bands = Band.select(:id, :name)
                   .where("name LIKE ?", "#{params[:letter]}%")
      @letters = ((?a..?z).to_a +
        @bands.collect { |el| el.name[0].downcase }).uniq
    end
end
