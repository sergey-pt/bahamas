class ClientsController < ApplicationController

  before_filter :find_client, only: :show

  def show
    respond_to do |format|
      format.json { render json: @client }
    end
  end

  private

  def find_client
    @client = params[:invoice_id] ? Client.find_by_id(params[:invoice_id]) : Client.find_by_id(params[:id])
  end

end
