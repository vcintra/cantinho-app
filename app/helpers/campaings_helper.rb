module CampaingsHelper
	def formatar_valor_BRL(price)
    ActionController::Base.helpers.number_to_currency(price, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end
end
