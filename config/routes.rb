Rails.application.routes.draw do

  match "jz" => "jz/users#jz", via: [:get, :post]
  
  namespace :jz do
    resources :records 
    resources :users
  end

  namespace :tyc do
    resources :cids
    resources :investe_abroads
    resources :gudongs
    resources :categories
    resources :industries
    resources :companies
    resources :humen
  end
  namespace :hz do
    resources :idcards
  end
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


  match "fc" => "jz/records#export", via: [:get]


  # ====== for python
  match "api/v1/uid" => "api#uid", via: [:get]
  match "api/v1/dc/users" => "api#dc_user", via: [:post]
  match "api/v1/dc/user/photos" => "api#dc_user_photos", via: [:post]
  match "api/v1/dc/check_info" => "api#check_info", via: [:get]

  match "api/v1/tyc/company" => "tyc#new", via: [:post]
  match "api/v1/tyc/cid" => "tyc#cid", via: [:post] # 公司id信息
  match "api/v1/tyc/request_cid" => "tyc#request_cid", via: [:get] # 公司id信息

  match "api/v1/tyc/need_verify" => "tyc#need_verify", via: [:post]
  match "api/v1/tyc/verify_ok" => "tyc/cids#verify_ok", via: [:post]
  match "api/v1/tyc/check_verify_ok" => "tyc#check_verify_ok", via: [:get]
  match "api/v1/tyc/cookie" => "tyc#cookie", via: [:get]



  match "/tyc/cid/cookie" => "tyc/cids#cookie", via: [:get, :post]

  # ====== for python

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments



  # ====== for c++
  match "api/names" => "ocr#names", via: [:get]
  match "api/idcards" => "ocr#idcards", via: [:get]
  match "api/fuck_idcards" => "ocr#fuck_idcards", via: [:get]

  match "api/idcards/:id" => "ocr#idcard", via: [:get]
  # match "api/idcard_short" => "ocr#idcard_short", via: [:get]
  match "api/xingshizheng" => "ocr#xingshizheng", via: [:get]
  match "api/names/:id" => "ocr#show", via: [:get]
  match "api/name_ids" => "ocr#name_ids", via: [:get]
  match "api/phones" => "ocr#phone", via: [:get]
  match "api/address" => "ocr#address", via: [:get]
  match "api/name" => "ocr#name", via: [:get]
  match "api/company" => "tyc#company", via: [:get]
  match "api/driving_license" => "ocr#driving_license", via: [:get]

  match "api/small_letter" => "ocr#small_letter", via: [:get]
  match "api/date_data" => "ocr#date_data", via: [:get]

  #存单
  match "api/cundan" => "ocr/danju#cundan", via: [:get]
  #二手车发票
  match "api/ershoupiao" => "ocr/danju#ershoupiao", via: [:get]
  #新车发票
  match "api/xinchepiao" => "ocr/danju#xinchepiao", via: [:get]
  #合格证
  match "api/hegezheng" => "ocr/danju#hegezheng", via: [:get]
  #进口凭证
  match "api/jinkoupinzheng" => "ocr/danju#jinkoupinzheng", via: [:get]
  #一致性证书
  match "api/yizhixing" => "ocr/danju#yizhixing", via: [:get]
  #增值税发票
  match "api/zhengzhipiao" => "ocr/danju#zhengzhipiao", via: [:get]

  #转账支票
  match "api/zhipiao" => "ocr/danju#zhipiao", via: [:get]

  # ====== for c++

  root "jz/users#jz"
end
