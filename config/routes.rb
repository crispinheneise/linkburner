# frozen_string_literal: true

Rails.application.routes.draw do
  resources :links, only: %i[new show create]
  root to: 'links#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
