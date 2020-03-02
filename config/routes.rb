# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: %i[ edit update ] do
    resources :comments, only: %i[ create update destroy ]
  end

  root to: 'posts#index'
end
