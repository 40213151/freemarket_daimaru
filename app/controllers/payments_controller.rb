class PaymentsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_action :set_pay_jp_api_key, only: [:create]
  set_item :set_item

  def create
    customer_id = current_user.card.customer_id
    charge = Payjp::Charge.create(
      amount: @item.price,
      currency: 'jpy',
      customer: customer_id
      )
    redirect_to root_path
  end

  private

  def set_payjp_api_key
    Payjp.api_key = "sk_test_910230dc46abc45cd72490f1"
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
