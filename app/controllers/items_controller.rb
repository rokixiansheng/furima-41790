class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    return if user_signed_in?

    redirect_to user_session_path
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
    params.require(:item).permit(:name, :price, :introduction, :category_id, :situation_id, :shipping_fee_id, :shipping_from_id,
                                 :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
