class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  attr_accessor :current_cart

  # def current_cart=(current_cart)
  #   @current_cart = current_cart
  # end
  #
  # def current_cart
  #   @current_cart
  # end

  # helper_method :current_cart
end
