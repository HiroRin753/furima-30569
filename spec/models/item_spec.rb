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
      @item.image = ""
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では出品できない' do 
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では出品できない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'condition_idが--では出品できない' do
      @item.condition_id(0)
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'category_idが--では出品できない' do
      @item.category_id(0)
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'shipping_cost_idが--では出品できない' do
      @item.shiping_cost_id(0)
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'days_to_ship_idが--では出品できない' do
      @item.days_to_ship_id(0)
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'ship_from_idが--では出品できない' do
      @item.ship_from_id(0)
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが空では出品できない' do 
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceは半角数字でなければならない' 
      @item.price = "９９９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it 'priceは¥300以上でなければならない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceは¥9,999,999以下でなければならない' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
