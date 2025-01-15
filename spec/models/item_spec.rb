require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '新規登録できるとき' do
      it '必要情報があれば登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリー情報がなければ登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報がなければ登録できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料の負担の情報がなければ登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域の情報がなければ登録できない' do
        @item.shipping_from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank")
      end
      it '発送までの日数の情報がなければ登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が¥300~¥9,999,999の間でなければ登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が全角の場合は登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '写真がない場合は登録できない' do
        @image = nil
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
