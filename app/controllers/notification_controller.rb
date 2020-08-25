require 'json'
require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class NotificationController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  # before_action :get_id, only: :create
  
  def create         
    request = OrdersGetRequest::new(get_id)
    
    begin
      response = PayPalClient::client.execute(request) 

      campaign = Campaign.find response.result.purchase_units[0].custom_id

      order = Order.new
      order.email = response.result.payer.email_address
      order.name = [response.result.payer.name[0].given_name,response.result.payer[0].name.surname].join(' ')
      order.price = response.result.purchase_units[0].amount.value
      order.order_id = response.result.id
      order.campaign_id = campaign.id
      order.save

      numbers = order.price / campaign.price

      while numbers >= 1
        item = Item.new
        item.order_id = order.id
        item.save
        numbers = numbers - 1
      end
      
      OrderMailer.confirmation(order).deliver_later!

      render json: { order: order }      
    rescue PayPalHttp::HttpError => ioe
      puts ioe.status_code
      puts ioe.headers["debug_id"]
    end
  end

  private

  def get_id      
    params[:resource][:links].select{|item| item[:href].include?('order')}.map{|item| item[:href]}.first.match('.*\/orders\/(.*)')[1]     
  end
end
