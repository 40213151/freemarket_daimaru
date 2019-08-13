class CardsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_action :set_payjp_api_key

  def new
  end

  def create
    customer = Payjp::Customer.create(description: 'test',card: params[:pay_id])
    card = Card.new(user_id: current_user.id,
      pay_id: params[:pay_id],
      customer_id: customer.id)
    card.save
    redirect_to root_path
  end

  private

  # ここにテスト秘密鍵をセットします。
  def set_payjp_api_key
    Payjp.api_key = "sk_test_910230dc46abc45cd72490f1"
  end
end
