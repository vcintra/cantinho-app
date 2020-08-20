class NotificationController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    order = Order.find(params[:id])
    puts params[:id]
  end
end
