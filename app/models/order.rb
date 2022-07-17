class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def address_display
    '〒' + destination_postal_code + ' ' + destination_address + ' ' + destination_name
  end

end
