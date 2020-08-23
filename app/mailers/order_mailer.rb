require 'sendgrid-ruby'
include SendGrid

class OrderMailer < ApplicationMailer 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation.subject
  #
  def confirmation(order) 
    @order = order
    @campaign = Campaign.find order.campaign_id
    mail to: @order.email, subject: "Números da sorte - Cantinho dos Idosos"
    # from = Email.new(email: 'sorteio@cantinhodosidosos.ong.br')
    # to = Email.new(email: 'vcintra@gmail.com')
    # subject = 'Números da Sorte - Cantinho dos Idosos'
    # content = Content.new(
    #   type: 'text/plain', 
    #   value: ApplicationController.render(
    #   template: PATH_TO_TEMPLATE,
    #   layout: nil,
    #   assigns: IF_NEEDED || {})
    # )
    # mail = SendGrid::Mail.new(from, subject, to, content)
    
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
  end
end
