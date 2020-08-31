class PurchasesController < ApplicationController
  before_action :login_check, only: :index
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user_id #出品者は購入画面にいけないようにしている
    @purchase = Purchase.new
   
    # @purchases = @item.purchase.includes(:user)
  end

  def create
    
  end

  private

end
