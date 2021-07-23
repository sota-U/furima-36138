require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: user.id, item_id: item.id)
      sleep(1)
    end
 
    context '内容に問題ない場合' do
      it '全ての値が正しく入力すれば保存できること' do
        expect(@purchase_shipment).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipment.building_name = ''
        expect(@purchase_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では登録できないこと' do
        @purchase_shipment.postal_code = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipment.postal_code ='1234567'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idが1では登録できないこと'do
        @purchase_shipment.shipping_area_id = 1
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'municipalityが空では登録できない' do
        @purchase_shipment.municipality = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できない' do
        @purchase_shipment.address = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @purchase_shipment.phone_number = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは半角数字じゃないと登録できないということ' do
        @purchase_shipment.phone_number = '０９０１２３４５６７８'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is not a number")
      end

      it 'phone_numberは10桁以上でないと保存できないこと' do
        @purchase_shipment.phone_number = '0801234'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberは11桁以下でないと保存できないこと' do
        @purchase_shipment.phone_number = '12345678987654321'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
