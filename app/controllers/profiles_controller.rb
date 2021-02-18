class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :show_user]

  def show
    @items  = current_user.items
    @image  = @profile.image
  end

  def show_user
    @image  = @profile.image
    @items  = @profile.items
  end

  def new 
    @profile = Profile.new
  end 
  
  def edit 
  end

  def create
    @profile.user = current_user
    if @profile.save
      redirect_to root_path, notice: "プロフィール情報の登録が完了しました" 
    else
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to root_path, notice: "プロフィール情報の更新が完了しました" 
    else
      render :edit
    end
  end

  def destroy
  end

  private 

  def find_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(
      :name, :self_introduction, :image, :id
    )
  end
end
