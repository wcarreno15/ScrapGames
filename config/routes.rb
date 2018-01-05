# frozen_string_literal: true

# Routes
Rails.application.routes.draw do
  root to: 'game#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
