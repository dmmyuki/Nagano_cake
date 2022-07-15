class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm
    @cart_items=current_customer.cart_items
    @order=Order.new(order_params)
    @order.postage=800
    @order.charge=0
    if params[:order][:select_address]=="0"
      @order.destination_postal_code=current_customer.postal_code
      @order.destination_address=current_customer.address
      @order.destination_name=current_customer.last_name + current_customer.first_name
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

  def create
    @order=Order.new(order_params)
    @order.save
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail=OrderDetail.new
      @order_detail.order_id=@order.id
      @order_detail.item_id=cart_item.item.id
      @order_detail.amount=cart_item.amount
      @order_detail.tax_price=cart_item.item.with_tax_price
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders=current_customer.orders.all
  end

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :destination_postal_code, :destination_address, :destination_name)
  end
end
