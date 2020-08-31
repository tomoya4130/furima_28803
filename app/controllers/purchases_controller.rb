class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user_id #出品者は購入画面にいけないようにしている
    @purchase = Purchase.new
   
    # @purchases = @item.purchase.includes(:user)
  end

  def create
    @purchase = Purchase.new(item_id: purchase_params[:item_id], user_id: purchase_params[:user_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :user_id, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_868ce3e4cb726eddddc57616"
    Payjp::Charge.create(
      item_id: purchase_params[:item_id], #商品のid
      user_id: purchase_params[:user_id], #出品者のid
      card: purchase_params[:token],   #カードトークン
      currency: 'jpy'                  #通過の種類（日本円）
    )
  end
end
