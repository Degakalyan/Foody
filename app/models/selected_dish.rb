class SelectedDish < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
  belongs_to :order, optional: true
  
  def total_cost
    dish.cost
  end

end
