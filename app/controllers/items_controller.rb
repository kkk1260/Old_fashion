class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def post
    @items = Item.order(created_at:"desc")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to post_items_path
    else
      render :new
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :category_id, :information, :brand).merge(user_id: current_user.id)
  end
end
# includes(:user).sample(30)