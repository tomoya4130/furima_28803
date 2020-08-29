class ItemsController < ApplicationController
  # before_action :authenticate_user!, expect: :index
  before_action :login_check, only: :new

  def index
    @items = Item.includes(:user).order('created_at DESC') # 新規投稿順に並び替える
  end

  def new
    @item = Item.new # itemテーブルに新しいレコードを追加する
  end

  def create
    @item = Item.new(item_params) # データの保存に成功したらトップページへ、失敗したら出品ページへ遷移する
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  # ログインしていない場合登録画面に遷移する
  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to new_user_session_path
    end
  end

  # create,updateでこのデータが保存されるかどうか判断する
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_burden_id, :shipping_region_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  # ActiveStorageによりログインしているユーザーが画像を添付した際にitemテーブルにあるnameとpriceカラムの情報も受け取るようにしている（itemとActiveStorageはアソシエーションにより紐づいている）
  def message_params
    params.require(:item).permit(:image, :name, :price).merge(user_id: current_user.id)
  end
end
