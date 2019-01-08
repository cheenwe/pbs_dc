Rails.application.routes.draw do
  namespace :hz do
    resources :banks
  end
  resources :uids
  namespace :dc do
    resources :photos
    resources :users
  end

  namespace :dc do
    resources :users
  end

  match "api/v1/uid" => "api#uid", via: [:get]
  match "api/v1/dc/users" => "api#dc_user", via: [:post]
  match "api/v1/dc/user/photos" => "api#dc_user_photos", via: [:post]
  match "api/v1/dc/check_info" => "api#check_info", via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments



  match "api/names" => "ocr#name", via: [:get]
  match "api/names/:id" => "ocr#show", via: [:get]
  match "api/name_ids" => "ocr#name_ids", via: [:get]
  match "api/phones" => "ocr#phone", via: [:get]


  root "dc/users#index"
end
