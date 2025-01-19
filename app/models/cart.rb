class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_amount
    cart_items.sum { |item| item.total_price }
  end
end
