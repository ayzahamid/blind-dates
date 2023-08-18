# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < ApiController
      def create
        employee = Employee.new(employee_params)

        if employee.save
          success_response(employee)
        else
          error_response(:unprocessable_entity, employee.errors.full_messages.to_sentence)
        end
      end

      private

      def employee_params
        params.fetch(:employee, {}).permit(:name, :department_id)
      end
    end
  end
end
