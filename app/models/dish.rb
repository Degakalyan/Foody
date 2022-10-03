class Dish < ApplicationRecord
  validates :name,presence:true
  validates :cost, presence: true, numericality: { greater_than: 0, less_than: 1000000 }

  belongs_to :menu
  has_many :selected_dishes, dependent: :destroy
  has_one :image
  has_many :reviews, as: :imageable

end
