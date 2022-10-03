class Cart < ApplicationRecord
  has_many :selected_dishes, dependent: :destroy
  def add_dish(dish)
    current_dish = selected_dishes.find_by(dish_id: dish.id)
    if current_dish
      current_dish.quantity += 1
    else
      current_dish = selected_dishes.build(dish_id: dish.id)
    end
    current_dish
  end
  def totalcartprice
    selected_dishes.collect{|selected_dish| selected_dish.valid? ? selected_dish.total_price : 0}.sum
  end
end
