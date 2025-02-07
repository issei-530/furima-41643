class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :invalid_access, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_destination = BuyDestination.new
  end

  def create
    @buy_destination = BuyDestination.new(destination_params)
    if @buy_destination.valid?
      pay_item
      @buy_destination.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def destination_params
    params.require(:buy_destination).permit(:post_code, :region_id, :city, :street_address, :building_name, :telephone, :buy_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def invalid_access
    if @item.buy.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
