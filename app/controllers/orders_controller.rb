class OrdersController < ApplicationController

  def index
    @purchase_shipment = PurchaseShipment.new
  end

  def create
    @purchase_shipment = PurchaseShipment.new(order_params)
    if @purchase_shipment.valid?
      @purchase_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def order_params
    params.require(:purchase_shipment).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge( user_id: current_user.id, item_id: params[:item_id])
  end
end
