class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    # if current_user == @item.user
    #   redirect_to root_path
    # end
  end
end
