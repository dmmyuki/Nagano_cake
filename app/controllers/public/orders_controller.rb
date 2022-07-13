class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
  end

  def show
  end

  def confirm
    @cart_items=current_customer.cart_items
    @total_price=0
    @order=Order.new(order_params)
    @order.postage=800
    if params[:order][:select_address]=="0"
      @order.destination_postal_code=current_customer.postal_code
      @order.destination_address=current_customer.address
      @order.destination_name=current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address]=="1"
      @address=Address.find(params[:order][:address_id])
      @order.destination_postal_code=@address.postal_code
      @order.destination_address=@address.address
      @order.destination_name=@address.name
    elsif params[:order][:select_address]=="2"
      @order.destination_postal_code=params[:order][:postal_code]
      @order.destination_address=params[:order][:address]
      @order.destination_name=params[:order][:name]
    end
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :destination_postal_code, :destination_address, :destination_name)
  end
end
