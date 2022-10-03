class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },presence: true
  validates :name,presence:true,on: :edit
  validates :role, inclusion: { in: %w(admin customer),
    message: "%{value} is not a valid role" },on: :edit

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders,dependent: :destroy

end
