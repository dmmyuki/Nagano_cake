class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  # 合計金額を求める
  def subtotal
    item.with_tax_price * amount
  end

end
