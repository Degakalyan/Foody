class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }

  belongs_to :imageable, polymorphic: true
end
