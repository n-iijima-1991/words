Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update]
  root to: 'toppages#index'
end
