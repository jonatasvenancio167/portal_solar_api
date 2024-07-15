class GenerateSimulationPdfJob < ApplicationJob
  queue_as :default

  def perform(simulation_id)
    simulation = Simulation.find(simulation_id)
    SimulationService.new(simulation).perform
  end
end