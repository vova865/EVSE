Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :api do
    namespace :v1 do
      get 'charging_stations', action: :index, controller: :charging_stations
      get 'charging_station', action: :show, controller: :charging_stations
      post 'create', action: :create, controller: :charging_stations
      put 'update', action: :update, controller: :charging_stations
      delete 'delete', action: :delete, controller: :charging_stations
    end
  end
end
