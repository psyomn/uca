class NewsitemsController < ApplicationController
  def index
    @newsitems = Newsitem.all
  end

  def new
  end

  def show
    @newsitem = Newsitem.find(newsitem_params[:id])
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

    def newsitem_params
      params.permit(:id, :title, :body)
    end
end
