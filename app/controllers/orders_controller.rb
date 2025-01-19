class OrdersController < ApplicationController

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       @order_delivery.save
       redirect_to root_path
    else
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:post_code, :shipping_from_id, :city, :address_detail, :building, :tel, :item_id).merge(user_id: current_user.id)
  end

end
