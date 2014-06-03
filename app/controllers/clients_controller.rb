class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
    respond_with(@clients)
  end

  def show
    respond_with(@client)
  end

  def new
    @client = Client.new
    @client.build_address
    respond_with(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.save
    respond_with(@client)
  end

  def update
    @client.update(client_params)
    respond_with(@client)
  end

  def destroy
    @client.destroy
    respond_with(@client)
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(
        :name, :cnpj, :cpf, :company, :person, :state_inscription, :city_inscription,
        :contact, :email, :phone1, :phone2, :address_id, :fantasy_name,
        address_attributes: [:cep, :number, :street_type, :street, :complement, :neighborhood, :city_id, :state])
    end
end
