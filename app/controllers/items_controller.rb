class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def post
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to post_items_path
    else
      render :new
    end
  end

  def show
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :category_id, :information, :brand).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
# includes(:user).sample(30)