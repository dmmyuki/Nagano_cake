class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
    @total_price=0
    @order.postage=800
  end

  private
  def order_params
    params.require(:order).permit(:destination_postal_code, :destination_address, :destination_name, :payment_method)
  end
end
