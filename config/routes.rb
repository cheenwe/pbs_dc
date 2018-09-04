Rails.application.routes.draw do
  namespace :dc do
    resources :photos
  end
  namespace :dc do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments
end
