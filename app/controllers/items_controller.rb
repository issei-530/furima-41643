class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :item_sold_out, only: [:edit, ]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end 

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, :shipping_fee_id, :region_id, :shipping_day_id, :price ).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_sold_out
    redirect_to root_path @item.buy
  end
end


