class SimulationsController < ApplicationController
  before_action :authenticate_client!

  def index
    @simulations = current_client.simulations
    render json: @simulations
  end

  def create
    @simulation = current_client.simulations.build(simulation_params)
    if @simulation.save
      recommended_generators = SimulationService.new(@simulation).perform

      render json: { simulation: @simulation, generators: recommended_generators }, status: :created
    else
      render json: @simulation.errors, status: :unprocessable_entity
    end
  end
  
  private

  def simulation_params
    params.require(:simulation).permit(:account_value)
  end
end