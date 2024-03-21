# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API Routes', type: :routing do
  it 'routes employees#create' do
    expect(post: '/api/v1/employees').to route_to('api/v1/employees#create', format: :json)
  end

  it 'routes invites#create' do
    expect(post: '/api/v1/invites').to route_to('api/v1/invites#create', format: :json)
  end

  it 'routes invites#update' do
    expect(put: '/api/v1/invites/1').to route_to('api/v1/invites#update', id: '1', format: :json)
  end

  it 'routes groups#index' do
    expect(get: '/api/v1/groups').to route_to('api/v1/groups#index', format: :json)
  end

  it 'routes groups#create' do
    expect(post: '/api/v1/groups').to route_to('api/v1/groups#create', format: :json)
  end
end
