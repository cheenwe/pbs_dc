Rails.application.routes.draw do
  namespace :dc do
    resources :photos
    resources :users
  end

  namespace :dc do
    resources :users
  end

  match "api/v1/dc/users" => "api#dc_user", via: [:post]
  match "api/v1/dc/user/photos" => "api#dc_user_photos", via: [:post]
  match "api/v1/dc/check_info" => "api#check_info", via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments
  root "dc/users#index"
end
