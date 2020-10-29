class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])

    category = Category.data.detect{|o| o[:id] == @item.category_id}
    @category = category[:name]

    condition = Condition.data.detect{|o| o[:id] == @item.condition_id}
    @condition = condition[:name]

    shippingcost = ShippingCost.data.detect{|o| o[:id] == @item.shipping_cost_id}
    @shippingcost = shippingcost[:name]

    shipfrom = ShipFrom.data.detect{|o| o[:id] == @item.ship_from_id}
    @shipfrom = shipfrom[:name]

    daystoship = DaysToShip.data.detect{|o| o[:id] == @item.days_to_ship_id}
    @daystoship = daystoship[:name]
  end

  private
  def items_params
    params.require(:item).permit(:name, :image, :description, :condition_id, :category_id, :shipping_cost_id, :days_to_ship_id, :ship_from_id, :price,)
    .merge(user_id: current_user.id)
  end
end
