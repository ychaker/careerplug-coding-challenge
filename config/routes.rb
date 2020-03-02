# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: %i[ edit update ] do
    resources :comments, except: %i[ index new show ]
  end

  root to: 'posts#index'
end
