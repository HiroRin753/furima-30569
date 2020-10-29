class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item)
    else 
      render :edit
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :image, :description, :condition_id, :category_id, :shipping_cost_id, :days_to_ship_id, :ship_from_id, :price,)
    .merge(user_id: current_user.id)
  end
end
