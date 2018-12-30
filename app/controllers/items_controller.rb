class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).limit(6)
  end
end
