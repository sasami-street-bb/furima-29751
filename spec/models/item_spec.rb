require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it "name,description,price,image,category_id,condition_id,shipping_fee_id,prefecture_id,shipping_date_idが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば出品できる" do
        @item.price = "1111"
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999の間であれば出品できる" do
        @item.price = "11111"
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "nameが空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが数字以外では出品できない" do
        @item.price = "abcあ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが¥300以下では出品できない" do
        @item.price = "11"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceが¥9,999,999以上では出品できない" do
        @item.price = "11111111"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが未選択では出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "condition_idが未選択では出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "shipping_fee_idが未選択では出品できない" do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end
      it "prefecture_idが未選択では出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "shipping_date_idが未選択では出品できない" do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end
    end
  end
end