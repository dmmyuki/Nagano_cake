class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end
  
  private
  def order_params
    params.require(:order).permit(:destination_postal_code, :destination_address, :destination_name, :payment_method)
  end
end
