Rails.application.routes.draw do

  devise_for :users
  root 'event#index'

  resources :event do
  	resources :attendances, except: [:new, :show, :edit] do
      resources :charges
      end
    end

  resources :users
end
