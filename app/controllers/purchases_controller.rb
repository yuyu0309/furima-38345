class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold
  before_action :item_user

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase_management.present?
  end

  def item_user
    redirect_to root_path if current_user.id == @item.user_id
  end

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
