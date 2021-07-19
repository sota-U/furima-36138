class ItemsController < ApplicationController
  def index
    #@item = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
      render new_item_path
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_charge_id, :shipping_area_id,
                                 :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
