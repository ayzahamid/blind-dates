# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees API', type: :request do
  describe 'POST /api/v1/employees' do
    let(:department) { create(:department) }
    let(:request) { post '/api/v1/employees', params: params }
    let(:employee_name) { 'John Doe' }
    let(:params) do
      { employee: { name: employee_name, department_id: department.id } }
    end
    let(:error_response) do
      { message: "Name can't be blank" }.as_json
    end

    context 'with valid parameters' do
      it 'creates a new employee' do
        request

        expect(response).to have_http_status(:ok)
        expect(json_response).to eq(Employee.last.as_json)
        expect(Employee.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      let(:employee_name) { '' }

      it 'returns unprocessable_entity status' do
        request

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response).to eq(error_response)
      end
    end
  end
end
