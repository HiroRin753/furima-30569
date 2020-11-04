class PurchasesController < ApplicationController
  # before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new(purchase_params)  
    if @user_purchase.valid?
       @user_purchase.save
       redirect_to root_path
    else
       render :index
    end
  end

  private
 def purchase_params
  params.require(:user_purchase).permit(:purchase_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: @item.id)
 end

 def items_params
  params.require(:item).permit(:name, :image, :description, :condition_id, :category_id, :shipping_cost_id, :days_to_ship_id, :ship_from_id, :price,)
  .merge(user_id: current_user.id)
 end

#  def set_item
  # @item = Item.find(params[:item_id])
#  end
end

