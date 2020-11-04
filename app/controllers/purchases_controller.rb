class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    # if @item.user = current_user
    #   redirect_to root_path
    # end
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)  
    if @user_purchase.valid?
       pay_item
       @user_purchase.save
       redirect_to root_path
    else
       render :index
    end
  end

  private
  def purchase_params
    params.require(:user_purchase).permit(:purchase_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_4f4a9f577b592b04043109c5"  
      Payjp::Charge.create(
        amount: purchase_params[:price],  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
    end
end

