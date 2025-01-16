require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品できるとき' do
      it '必要情報があれば登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
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
      it '価格が¥300未満だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が¥9,999,999を超えると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が全角の場合は登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が整数でないと登録できない' do
        @item.price = '500.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it '写真がない場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'ユーザー情報がないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
    end
  end
end
