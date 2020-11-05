require 'rails_helper'
  describe UserPurchase do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end
   context '購入処理が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
    end

   context '購入処理が保存できないとき' do

      it 'tokenが空では保存できないこと' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_purchase.prefecture_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空では保存できないこと' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @user_purchase.house_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @user_purchase.phone = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneにハイフンがあると保存できないこと' do
        @user_purchase.phone = '000-0000-0000'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone is not a number")
      end
      it 'phoneが11文字より大きいと保存できないこと' do 
        @user_purchase.phone = '000000000000'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include()
      end
   end
  end