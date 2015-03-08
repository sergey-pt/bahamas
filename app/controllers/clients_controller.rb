class ClientsController < ApplicationController

  helper_method :collection

  private

  def collection
    @clients = Client.all.order('created_at DESC')
  end

end
