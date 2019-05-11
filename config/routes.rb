Rails.application.routes.draw do

  match "jz" => "jz/users#jz", via: [:get, :post]
  match "jz/sx" => "jz/sxes#sx", via: [:get, :post]
  match "shixi" => "jz/sxes#sx", via: [:get, :post]

  # 兼职信息管理
  namespace :jz do
    resources :records
    resources :sxes
    resources :users
  end

  # 爬虫-途虎车辆数据及保养相关数据
  namespace :tuhu do
    resources :products
    resources :details
    resources :versions
    resources :brands
  end


  match "tuhu" => "tuhu/brands#tuhu", via: [:get, :post]

  # 爬虫-天眼查数据
  namespace :tyc do
    resources :cids
    resources :investe_abroads
    resources :gudongs
    resources :categories
    resources :industries
    resources :companies
    resources :humen
  end

  # 假数据-身份证银行卡
  namespace :hz do
    resources :idcards
    resources :banks
  end

  # 爬虫-世纪佳缘数据
  resources :uids
  namespace :dc do
    resources :photos
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

  match "api/v1/tuhu/brand" => "tuhu#brand", via: [:post]

  match "api/v1/tuhu/cid" => "tuhu#cid", via: [:post] # 车型信息
  match "api/v1/tuhu/request_cid" => "tuhu#request_cid", via: [:get] # 车型信息


  # ====== for python

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments

  # ====== for c++

  match "api/idcards/:id" => "ocr#idcard", via: [:get]

  ## 假数据生成， 身份证， 行驶证，地址，手机号， 大小写金额数字转换，存单，二手车发票等等
  # match "api/idcard_short" => "ocr#idcard_short", via: [:get]
  match "api/names/:id" => "ocr#show", via: [:get]
  match "api/name_ids" => "ocr#name_ids", via: [:get]

  #转账信息
  match "api/names" => "ocr#names", via: [:get]
  #身份证
  match "api/idcards" => "ocr#idcards", via: [:get]
  match "api/fuck_idcards" => "ocr#fuck_idcards", via: [:get]

  #行驶证
  match "api/xingshizheng" => "ocr#xingshizheng", via: [:get]
  #号码
  match "api/phones" => "ocr#phone", via: [:get]
  #地址
  match "api/address" => "ocr#address", via: [:get]
  #姓名
  match "api/name" => "ocr#name", via: [:get]
  #公司
  match "api/company" => "tyc#company", via: [:get]
  #驾照
  match "api/driving_license" => "ocr#driving_license", via: [:get]
  #小写数字
  match "api/small_letter" => "ocr#small_letter", via: [:get]
  #日期数据
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


  root "jz/users#jz"
end
