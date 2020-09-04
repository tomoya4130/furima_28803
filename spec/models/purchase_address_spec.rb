require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入者情報' do
    before do
      sleep 1
      user = FactoryBot.create(:user)
      another_user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user: another_user)
      item.image = fixture_file_upload('/files/arrow_top.png')
      item.save
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    describe '商品購入機能' do
      context '商品の購入がうまくいくとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@purchase_address).to be_valid
        end
        it 'buildingは空でも保存できること' do
          @purchase_address.building = nil
          expect(@purchase_address).to be_valid
        end
      end
    


      context '商品の購入がうまくいかないとき' do
        it 'tokenが空のだと保存できない' do 
          @purchase_address.token = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空だと保存できないこと' do
          @purchase_address.postal_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_address.postal_code = '0900000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'prefecture_idを選択していないと保存できないこと' do
          @purchase_address.prefecture_id = '0'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
        end
        it 'cityは空だと保存できないこと' do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberは空だと保存できないこと' do
          @purchase_address.house_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空だと保存できないこと' do
          @purchase_address.phone_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが0から始まらないと保存できないこと' do
          @purchase_address.phone_number = '9898989898'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
        end
      end
    end
  end
end
