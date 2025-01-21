class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_delivery = OrderDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       pay_item
       @order_delivery.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'orders/index', status: :unprocessable_entity
    end
  end
  
  private
  def order_params
    params.require(:order_delivery).permit(:post_code, :shipping_from_id, :city, :address_detail, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
