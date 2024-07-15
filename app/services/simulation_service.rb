# app/services/simulation_service.rb
class SimulationService
  POWER_FACTOR = 94.5

  def initialize(simulation)
    @simulation = simulation
  end

  def perform
    response = RestClient.get 'https://my.api.mockaroo.com/geradores?key=630e7920&page=1&page_size=10'
    data = JSON.parse(response.body)
    generators = data['items']

    power_needed = @simulation.account_value / POWER_FACTOR

    recommended_generators = generators.select { |g| g['power'].to_f >= power_needed }

    pdf_content = generate_pdf(recommended_generators)
    
    save_pdf(pdf_content)

    recommended_generators
  end

  private

  def generate_pdf(generators)
    pdf_html = ApplicationController.render(
      pdf: 'filename',
      type: "application/pdf",
      template: "layouts/layout.html.erb",
      layout: false,
      locals: { generators: generators }
    )
  end

  def save_pdf(content)
    if content.present?
      pdf_base64 = Base64.strict_encode64(content)
      @simulation.update(pdf: pdf_base64)
    else
      Rails.logger.error "PDF content is empty"
    end
  rescue StandardError => e
    Rails.logger.error "Failed to save PDF: #{e.message}"
  end
end
