class RestaurantTimingsJob < ApplicationJob
  queue_as :Order
  def perform(timings)
  Restaurant.update(timings: timings)
  Restaurant.save
  end


end
