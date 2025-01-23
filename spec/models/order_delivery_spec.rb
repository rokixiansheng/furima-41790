require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_delivery.shipping_from_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Shipping from can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_delivery.address_detail = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address detail can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @order_delivery.tel = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_delivery.tel = '090-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel must be 10 or 11 digits")
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order_delivery.tel = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel must be 10 or 11 digits")
      end
      it '電話番号が12桁以上だと保存できないこと' do
        @order_delivery.tel = '123456781234'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel must be 10 or 11 digits")
      end
      it 'tokenが空だと保存できないこと' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
