class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipment = PurchaseShipment.new
    if user_signed_in?
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    else
      
    end
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_shipment = PurchaseShipment.new(order_params)
    @price = @item.price
    if @purchase_shipment.valid?
      pay_item
      @purchase_shipment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:purchase_shipment).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(order_params[:item_id])
  end
end
