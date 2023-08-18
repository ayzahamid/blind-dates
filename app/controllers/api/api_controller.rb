# frozen_string_literal: true

module Api
  class ApiController < ActionController::API
    include ExceptionHandler

    protected

    def error_response(error_message, status)
      render json: { succcess: false, error: error_message }, status: status
    end
  end
end
