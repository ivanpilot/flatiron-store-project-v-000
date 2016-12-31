class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_cart
    if current_user.carts.exists?(id: params[:id])
      cart = current_user.carts.where(id: params[:id], status: nil).first
      cart.status.nil? ? current_user.current_cart = cart : current_user.current_cart = nil
      # else
      #   nil
      # end

      # if cart.status.nil?
      #   # binding.pry
      #   current_user.current_cart = cart
      # else
      #   nil
      # end
    end
  end

  # def current_cart
  #   if current_user
  #
  # end

  helper_method :current_cart


end
