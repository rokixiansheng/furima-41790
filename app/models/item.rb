class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_fee, class_name: 'ShippingFee'
  belongs_to :shipping_from, class_name: 'ShippingFrom'
  belongs_to :shipping_date, class_name: 'ShippingDate'

  validates :name, :introduction, :image, presence: true
  validates :category_id, :situation_id, :shipping_fee_id, :shipping_from_id, :shipping_date_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { only_integer: true }
  validates :price, inclusion: { in: 300..9_999_999 }
  
end
