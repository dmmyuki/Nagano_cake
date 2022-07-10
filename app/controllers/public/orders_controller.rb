class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @credit_card=Order.payment_methods.key(0)
    @transfer=Order.payment_methods.key(1)
    @credit_card_ja=Order.payment_methods_i18n[:credit_card]
    @transfer_ja=Order.payment_methods_i18n[:transfer]
  end

  def index
  end

  def show
  end

  def confirm
  end
end
