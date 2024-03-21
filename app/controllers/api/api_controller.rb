# frozen_string_literal: true

module Api
  class ApiController < ActionController::API
    include ExceptionHandler

    protected

    def success_response(object)
      render json: object.to_json, status: :ok
    end

    def error_response(status, message = nil)
      render json: { message: message || I18n.t('unprocessable_request') }, status: status
    end
  end
end
