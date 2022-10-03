class Order < ApplicationRecord
  validates :mobilenumber, presence: true,numericality: true,length: { minimum: 10, maximum: 12 }

  after_create:order_placed
  has_many :selected_dishes, dependent: :destroy

  def add_line_dishes_from_cart(cart)
    cart.selected_dishes.each do |item|
      item.cart_id = nil
      selected_dishes << item
    end
  end
  def order_placed
    puts "Thank you for placing order ,Thank you mail has been sent successfully"
  end
end
