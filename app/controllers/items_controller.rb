class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :pay]
  # protect_from_forgery :except => [:pay]
  before_action :set_pay_jp_api_key, only: [:pay]

  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
    @item = current_user.items.new
    @item.images.new
    # @maincategories = Maincategory.all.order("id ASC").limit(13)
  end

  def create
    binding.pry
    @item = current_user.items.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    if params[:l_cat]
      @m_cat = Maincategory.find(params[:l_cat]).children
    else
      @s_cat = Maincategory.find(params[:m_cat]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @items = Item.where.not(id: @item.id).order("RAND()").limit(6)
  end

  def pay
    binding.pry
    # customer_id = current_user.cards.first.customer_id
    customer_id = Card.where(user_id: current_user.id).first.customer_id
    charge = Payjp::Charge.create(
      amount: @item.price,
      currency: 'jpy',
      customer: customer_id
      )
    redirect_to root_path
  end

  def kensaku
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :condition,:maincategory_id, :description, :delivery_days, :price, :delivery_burden, :delivery_from, images_attributes: [:image, :_destroy, :id])
  end

  def set_pay_jp_api_key
    Payjp.api_key = "sk_test_910230dc46abc45cd72490f1"
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
