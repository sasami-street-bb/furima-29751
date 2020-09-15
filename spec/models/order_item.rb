require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_item)
    end

    context '商品購入がうまくいくとき' do
      it "postal_code,city,house_number,phone_number,user_id,item_id,token,prefecture_idが存在すれば購入できる" do
        expect(@order).to be_valid
      end
      it "building_nameが空欄でも購入できる" do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "postal_codeが空では購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "cityが空では購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では購入できない" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "prefecture_idが未選択では購入できない" do
        @order.prefecture_id = "0"
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "postal_codeがハイフンなしでは購入できない" do
        @order.postal_code = "1111111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberがハイフンありでは購入できない" do
        @order.phone_number = "11111-11-1-11"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが11桁以上では購入できない" do
        @order.phone_number = "1234567890045"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end