class ItemsController < ApplicationController

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :condition_id, :category_id, :shipping_cost_id, :days_to_ship_id, :ship_from_id, :price).merge(user_id: current_user.id)
  end
end
