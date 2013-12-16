class Feedstock::OutputsController < ApplicationController
  before_action :set_output, only: [:show, :edit, :update, :destroy]

  def index
    @feedstock_outputs = Feedstock::Output.all
    respond_with @feedstock_outputs
  end

  def show
    respond_with @feedstock_output
  end

  def new
    @feedstock_output = Feedstock::Output.new
    respond_with @feedstock_output
  end

  def create
    @feedstock_output = Feedstock::Output.new(output_params)
    @feedstock_output.save
    respond_with_different_location @feedstock_output
  end

  def update
    @feedstock_output.update(output_params)
    respond_with_different_location @feedstock_output
  end

  def destroy
    @feedstock_output.destroy
    respond_with @feedstock_output
  end

  private
    def respond_with_different_location(feedstock_output)
      respond_with feedstock_output,
        :location => feedstock_output_items_path(feedstock_output)
    end
    
    def set_output
      @feedstock_output = Feedstock::Output.find(params[:id])
    end

    def output_params
      params.require(:feedstock_output).permit(:date, :employee)
    end
end
