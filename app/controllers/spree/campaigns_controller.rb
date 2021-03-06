module Spree
  class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]

    # GET /campaigns
    def index
      @campaigns = Spree::Campaign.all
    end

    # GET /campaigns/1
    def show
    end

    # GET /campaigns/new
    def new
      @campaign = Spree::Campaign.new
    end

    # GET /campaigns/1/edit
    def edit
    end

    # POST /campaigns
    def create
      @campaign = Spree::Campaign.new(campaign_params)

      if @campaign.save
        redirect_to @campaign, notice: 'Campaign was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /campaigns/1
    def update
      if @campaign.update(campaign_params)
        redirect_to @campaign, notice: 'Campaign was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /campaigns/1
    def destroy
      @campaign.destroy
      redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Spree::Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params[:campaign]
    end
  end
end
