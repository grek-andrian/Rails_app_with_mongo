Rails.application.routes.draw do
  resources :zips
  root 'zips#index'
end
