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

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end
end
