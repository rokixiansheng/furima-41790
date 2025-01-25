class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    if current_user == @item.user && @item.order.present?
      redirect_to root_path
    elsif current_user == @item.user
      set_item
    else
      redirect_to user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :situation_id, :shipping_fee_id, :shipping_from_id,
                                 :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  
end
