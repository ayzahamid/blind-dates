# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      error_response(:not_found, error.message)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      error_response(:unprocessable_entity, error.message)
    end
  end
end
