class ItemsController < ApplicationController
  #before_action :authenticate_user!, expect: :index
  before_action :login_check, only: :new

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  private
  #ログインしていない場合登録画面に遷移する
  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path 
    end
  end
  #ActiveStorageによりログインしているユーザーが画像を添付した際にitemテーブルにあるnameとpriceカラムの情報も受け取るようにしている（itemとActiveStorageはアソシエーションにより紐づいている）
  def message_params
    params.require(:item).permit(:image, :name, :price).merge(user_id: current_user.id)
  end 
end
