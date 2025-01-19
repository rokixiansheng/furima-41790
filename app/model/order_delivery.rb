class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_from_id, :city, :address_detail, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :city, :address_detail, :user_id, :item_id
    validates :post_code, :tel, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end  
  validates :shipping_from_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, shipping_from_id: shipping_from_id, city: city, address_detail: address_detail, building: building, tel: tel, order_id: order.id)
  end
  
end
