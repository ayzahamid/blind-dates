# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :employees, only: [:create]
      resources :invites, only: [:create, :update]
    end
  end
end
