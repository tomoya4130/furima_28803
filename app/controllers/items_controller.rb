class ItemsController < ApplicationController
  # before_action :authenticate_user!, expect: :index

  def index
    @items = Item.all
  end
end
