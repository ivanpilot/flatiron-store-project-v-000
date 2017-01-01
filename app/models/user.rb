class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  def current_cart
    # if !self.carts.find_by(status: nil)
    #   @current_cart = self.carts.find_by(status: nil)
    # end
    @current_cart = self.carts.find_by(status: nil)
    # binding.pry
  end

  def current_cart=(current_cart)
    @current_cart = current_cart
  end

end
