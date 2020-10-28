require 'rails_helper'
describe Item do
  before do 
    @item = FactoryBot.build(:item)
  end
 describe '商品出品機能' do
  context '商品出品がうまくいくとき' do 
    it 'name,image,price,description,condition,category,shippingfee,daystoship,shipfromがあれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do 
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では出品できない' do 
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'conditionが空では出品できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'condition_idが--では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'categoryが空では出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'categoryが--では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'shipping_costが空では出品できない' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it 'shipping_costが--では出品できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it 'days_to_shipが空では出品できない' do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it 'days_to_shipが--では出品できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it 'ship_fromが空では出品できない' do
      @item.ship_from_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from can't be blank")
    end
    it 'ship_fromが--では出品できない' do
      @item.ship_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from must be other than 1")
    end
    it 'priceが空では出品できない' do 
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceは半角数字でなければならない' do
      @item.price = '７７７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は半角数字のみで入力してください")
    end
    it 'priceは¥300以上でなければならない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceは¥9,999,999以下でなければならない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
 end
end
