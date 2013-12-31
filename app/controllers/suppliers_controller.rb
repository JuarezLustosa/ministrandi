class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @suppliers = Supplier.all
    respond_with(@suppliers)
  end

  def show
    respond_with(@supplier)
  end

  def new
    @supplier = Supplier.new
    @supplier.build_address
    respond_with(@supplier)
  end

  def edit
    @supplier.build_address unless @supplier.address
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.save
    respond_with(@supplier)
  end

  def update
    @supplier.update(supplier_params)
    respond_with(@supplier)
  end

  def destroy
    @supplier.destroy
    respond_with(@supplier)
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(
        :name, :cnpj, :fantasy, :contact, :email, :phone1, :phone2, :state_scription,
        address_attributes: [:cep, :number, :street_type, :street, :complement, :neighborhood, :city_id, :state])
    end
end
