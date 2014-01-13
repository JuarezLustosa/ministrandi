class Feedstocks::Outputs::FinishController < ApplicationController
  def update
    @feedstock_output = Feedstock::Output.find(params[:output_id])
    @feedstock_output.finish

    diferente_location @feedstock_output
  end
  
  private
  
  def diferente_location feedstock_output
    respond_with feedstock_output, :location => feedstock_outputs_path
  end
end