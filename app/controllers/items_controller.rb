class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index]

  def index
    @tag_list = Tag.all
    @items = Item.all
    
  end

  def new
    @tag_list = Tag.all
    @items = Item.all 
    @item = current_user.items.new 
  end

  def edit 
    @item_tags = @item.tags.pluck(:tag_name).join(" ") 
  end

  def post
    @items = Item.all
  end

  def create
    tag_list = params[:item][:tag_name].split(nil)  
    if @item.save
      @item.save_tag(tag_list)
      redirect_to post_items_path
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    tag_list = params[:item][:tag_name].split(nil)  
    if @item.update(item_params)
      @item.save_tag(tag_list)
      redirect_to root_path, notice: "投稿情報の更新が完了しました" 
    else
      render :edit
    end
  end

  def show
    @item_tags = @item.tags 
    @profile = @item.profile
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def modal
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :category_id, :information).merge(user_id: current_user.id, profile_id: current_user.profile.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end