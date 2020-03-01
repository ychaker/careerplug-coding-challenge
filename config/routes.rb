# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: %i[ edit update ]

  root to: 'posts#index'
end
