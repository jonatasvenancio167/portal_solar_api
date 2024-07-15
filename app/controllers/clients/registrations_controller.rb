# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  def update
    if current_client.update(client_params)
      render json: current_client, status: :ok
    else
      render json: { errors: current_client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete
    current_client.destroy
    
    render json: current_client, status: :ok
  end

  # protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :password, :password_confirmation)
  end
end
