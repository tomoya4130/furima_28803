require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/arrow_top.png")
    end

    describe '商品出品機能' do
      context '商品の出品がうまくいくとき' do
        it 'image,name,text,category_id,status_id,shipping_fee_burden_id,shipping_region_id,days_until_shipping_id,price,user_idが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品の出品がうまくいかないとき' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'textが空では登録できない' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it 'category_idが空では登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it 'status_idが空だと登録できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status Select")
        end
        it 'shipping_fee_burden_idが空だと登録できない' do
          @item.shipping_fee_burden_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee burden Select")
        end
        it 'shipping_region_idが空だと登録できない' do
          @item.shipping_region_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping region Select")
        end
        it 'days_until_shipping_idが空だと登録できない' do
          @item.days_until_shipping_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days until shipping Select")
        end
        it 'priceが空だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'price半角数字でないと登録可能' do
          @item.price = "aaaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it 'priceの範囲が、¥300~¥9,999,999の間でないと登録できない' do
          @item.price = "100"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
      end
    end
  end
end
