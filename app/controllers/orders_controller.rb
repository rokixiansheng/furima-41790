class OrdersController < ApplicationController

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    binding.pry
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       @order_delivery.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.permit(:post_code, :shipping_from_id, :city, :address_detail, :building, :tel, :item_id).merge(user_id: current_user.id)
  end

end
