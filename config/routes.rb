Rails.application.routes.draw do

  namespace :che300 do
    resources :infos
  end

  namespace :cn do
    resources :companies
  end

  namespace :monitor do
    resources :infos
    resources :servers
    resources :gpus
  end

  # 爬虫-途虎车辆数据及保养相关数据
  namespace :tuhu do
    resources :products
    resources :details
    resources :versions
    resources :brands
  end

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

  # 气象数据爬取
  namespace :qx do
    resources :landings
    resources :messages
    resources :take_offs
    resources :weathers
    resources :runways
    resources :airports
    resources :infos
  end

  # 采购公告
  namespace :cg do
    resources :kinds
    resources :keys
    resources :gonggaos
  end


  match "tuhu" => "tuhu/brands#tuhu", via: [:get, :post]

  # 汽车数据
  match "car" => "home#car", via: [:get]
  match "car/details/search" => "car/details#search", via: [:get]
  match "car/details/param" => "car/details#param", via: [:get]
  match "car/pictures/search" => "car/pictures#search", via: [:get]
  match "car/items/search" => "car/items#search", via: [:get]

  namespace :car do
    resources :brands
    resources :items
    resources :series
    resources :pictures
    resources :details
    resources :configs
  end


  match "api/v1/qx/runway" => "qx#runway", via: [:post] # runway
  match "api/v1/qx/weather" => "qx#weather", via: [:post] # weather
  match "api/v1/qx/take_off" => "qx#take_off", via: [:post] # take_off
  match "api/v1/qx/landing" => "qx#landing", via: [:post] # landing
  match "api/v1/qx/message" => "qx#message", via: [:post] # message
  match "qx" => "qx#qx", via: [:get] # weather
  match "tuhu" => "tuhu/brands#tuhu", via: [:get, :post]
  match "cg" => "home#cg", via: [:get, :post]



  # ====== for python
  match "api/v1/monitor" => "api#monitor", via: [:post] #监测服务器数据
  match "api/v1/gpu" => "api#gpu", via: [:post] #监测服务器数据
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

  match "api/v1/che300" => "tuhu#che300", via: [:post]
  match "api/v1/che300" => "tuhu#che300_info", via: [:get]

  match "api/v1/tuhu/cid" => "tuhu#cid", via: [:post] # 车型信息
  match "api/v1/tuhu/request_cid" => "tuhu#request_cid", via: [:get] # 车型信息


  #采购公告
  match "api/v1/cg", to: 'cg#gonggao', via: [:post]
  match "/api/v1/cg/kinds/list" => "cg/kinds#list", via: [:get, :post]
  match "/cg/kinds/list" => "cg/kinds#list", via: [:get]

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
  match "api/company1" => "tyc#company1", via: [:get]

  #驾照
  match "api/driving_license" => "ocr#driving_license", via: [:get]
  #小写数字
  match "api/small_letter" => "ocr#small_letter", via: [:get]
  #日期数据
  match "api/date_data" => "ocr#date_data", via: [:get]
  #存单
  match "api/cundan" => "ocr#cundan", via: [:get]
  #二手车发票
  match "api/ershoupiao" => "ocr#ershoupiao", via: [:get]
  #新车发票
  match "api/xinchepiao" => "ocr#xinchepiao", via: [:get]
  #合格证
  match "api/hegezheng" => "ocr#hegezheng", via: [:get]
  #进口凭证
  match "api/jinkoupinzheng" => "ocr#jinkoupinzheng", via: [:get]
  #一致性证书
  match "api/yizhixing" => "ocr#yizhixing", via: [:get]
  #增值税发票
  match "api/zhengzhipiao" => "ocr#zhengzhipiao", via: [:get]
  #转账支票
  match "api/zhipiao" => "ocr#zhipiao", via: [:get]


  root "home#index"
end
