class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, :shipping_fee_id, :region_id, :shipping_day_id, :price ).merge(user_id: current_user.id)
  end
end


