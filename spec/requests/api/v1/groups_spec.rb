# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groups API', type: :request do
  let(:request) { post '/api/v1/groups' }
  let(:current_week) { Date.current.beginning_of_week }
  let(:employees) { create_list(:employee, 10) }
  let(:success_response) { { message: 'Groups generated successfully' }.as_json }
  let(:failure_response) { { message: error_message }.as_json }

  describe 'GET /api/v1/groups' do
    let(:group) { create(:group, start_date_of_week: current_week) }
    let(:other_group) { create(:group, start_date_of_week: 1.week.from_now.beginning_of_week) }

    before do
      group
      other_group
    end

    it 'returns a list of groups for the specified start date' do
      get '/api/v1/groups', params: { start_date: Date.current }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(json_response['data']).to be_an(Array)
      expect(json_response['data'].length).to eq(1)
      expect(json_response['data'].first['id']).to eq(group.id)
    end
  end

  describe 'POST /api/v1/groups' do
    before do
      employees.each do |employee|
        create(:invite, employee: employee, start_date_of_week: current_week, status: 'yes')
      end
    end

    it 'generates groups successfully' do
      request

      expect(response).to have_http_status(:ok)
      expect(json_response).to eq(success_response)
      expect(Group.count).to be > 2
    end

    context 'when group already exists for the week' do
      let(:error_message) { 'Groups were already created for this week' }

      before do
        Group.create(start_date_of_week: current_week)
      end

      it 'returns unprocessable_entity status on failure' do
        request

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response).to eq(failure_response)
      end
    end
  end

  def json_response
    JSON.parse(response.body)
  end
end
