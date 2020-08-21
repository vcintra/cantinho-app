class OrderController < ApplicationController  
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
  end
end
