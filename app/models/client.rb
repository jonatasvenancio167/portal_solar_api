class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :simulations, dependent: :destroy

  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, presence: true, on: :create
end
