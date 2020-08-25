class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @campaigns = Campaign.all.where(blocked: false).order(price: :desc)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def order_create
  end
end