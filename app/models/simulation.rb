class Simulation < ApplicationRecord
  belongs_to :client

  validates :account_value, presence: true, numericality: { greater_than: 0 }
  #validate :daily_limit, on: :create

  private

  def daily_limit
    if client.simulations.where('created_at >= ?', Time.zone.now.beginning_of_day).count >= 5
      errors.add(:base, "A simulação diariamente pode ser criada no máximo 5 vezes.")
    end
  end
end
