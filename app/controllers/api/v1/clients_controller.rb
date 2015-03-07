module V1
  class ClientsController < ApplicationController

    before_filter :find_client, only: :show

    def create
      @client = Client.new permitted_params
      if @client.save
        render json: @client
      else
        render json: { errors: @client.errors.full_messages }, status: 422
      end
    end

    def show
      respond_to do |format|
        format.json { render json: @client }
      end
    end

    private

    def find_client
      @client = params[:invoice_id].present? ? Client.find_by_invoice_id(params[:invoice_id]) : Client.find_by_id(params[:id])
    end

    def permitted_params
      params.permit(:invoice_id, :fiscal_id, :name, :email)
    end
  end
end
