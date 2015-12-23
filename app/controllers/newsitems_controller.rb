class NewsitemsController < ApplicationController
  load_and_authorize_resource only: [:new, :edit, :create, :destroy, :update]

  def index
    @newsitems = Newsitem.all
  end

  def new
    @newsitem = Newsitem.new
  end

  def show
    @newsitem = Newsitem.find(params.permit(:id)[:id])
  end

  def edit
    @newsitem = Newsitem.find(newsitem_params[:id])
  end

  def create
    @newsitem = Newsitem.new(newsitem_params)
    @newsitem.user = current_user
    if @newsitem.save
      flash[:notice] = "Created newsitem!"
      redirect_to newsitem_path(@newsitem)
    else
      flash[:alert] = "Problem creating newsitem"
      redirect_to :new
    end
  end

  def destroy
  end

  def update
  end

  private
    def newsitem_params
      params.require(:newsitem).permit(:id, :title, :body)
    end
end
