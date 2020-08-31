class PurchasesController < ApplicationController
  before_action :login_check, only: :index

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    # @purchases = @item.purchase.includes(:user)
  end

  def create
    #@item = Item.find(params[:item_id])
    # @purchase = Purchase.new(purchase_params) # データの保存に成功したらトップページへ、失敗したら出品ページへ遷移する
    # if @purchase.save
    # redirect_to items_path
    # else
    # render :index
    # end
  end

  private

  # ログインしていない場合登録画面に遷移する
  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to new_user_session_path
    end
  end

  def purchase_params
    params.require(:purchase).permit(user_id: current_user.id, item_id: params[:item_id])
  end

end
