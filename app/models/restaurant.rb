class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :reviews, as: :imageable

  around_update :restaurant_ststus# if: :timings_previously_changed?

  def restaurant_ststus
        RestaurantTimingsJob.set(wait_until: 5.minutes).perform_later(self.timings)
  end
end
