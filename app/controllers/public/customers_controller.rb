class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def mypage
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to mypage_customers_path(current_customer)
  end

  def withdrawal
    @customer=current_customer
    @customer.update(is_acive: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
