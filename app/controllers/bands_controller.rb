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
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "No such band exists. Sorry! Try choosing something from the list."
    redirect_to :bands
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    @band = Band.new(band_params)
    user = current_user
    @band.user = user

    if @band.save
      flash[:notice] = "Band has been registered!"
      redirect_to band_path(@band)
    else
      flash[:alert] = "Could not create band"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
    def band_params
      params.require(:band).permit(:id, :name, :description)
    end

    def letter_list
      # TODO this might need optimization
      @bands = Band.select(:id, :name)
                   .where("name LIKE ?", "#{params[:letter]}%")
      @letters = ((?a..?z).to_a +
        @bands.collect { |el| el.name[0].downcase }).uniq
    end
end
