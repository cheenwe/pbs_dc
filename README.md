# README


1. Active Storage (类似 Carrierwave 的实现） - https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond


2. Credentials
参数文件配置, 以前借助于 setting 等 Gem, 现在 rails 5.2 已集成进来, 并且增加安全性能,
文件存储在 onfig/credentials.yml.enc

- 修改配置文件:

>EDITOR=vi bin/rails credentials:edit

- 查看配置文件

>bin/rails credentials:show

- 获取配置

单个:

>Rails.application.credentials.key_name

嵌套:

>Rails.application.credentials.dig(:section_name, :nested_key_name)

or

>Rails.application.credentials.key_name[:nested_key_name]

3. Qrcode

https://github.com/whomwah/rqrcode/


# api

## post api/v1/dc/users

uid
photo_num
photo_hash
sign



# 添加调用接口
  -添加路由 config/routes.rb
  -创建方法 controllers/ocr_controller.rb



rails g scaffold tyc/cid city_id:integer state:integer number:string 
rails db:migrate 


rails g scaffold jz/user code:string name:string phone:string alipay:string rate:integer remark:string this_month_num:integer
rails db:migrate 

rails g scaffold jz/record user_id:integer enter_at:datetime is_first:boolean computer_num:integer remark:string
rails db:migrate 
rails d scaffold jz/record

rails g scaffold jz/sx user_id:integer name:string start_at:datetime end_at:datetime
rails db:migrate 

#MVC
ActiveRecord（Model层）：是 Rails 的 ORM 组件，负责与数据库沟通，让我们可以用面向对象的语法操作数据库。
ActionView（View层）：在Rails中使处理View的部件，负责显示用户的界面以及controller传来的数据。
ActionController（Controller层）：主要负责处理 Web 请求，检索模型数据并按要求将数据传递给视图。控制器是模型和视图的联系桥梁。



rails g scaffold tuhu/brand name:string logo:string abbr:string reamrk:string 

rails g scaffold tuhu/version brand_id:integer:index name:string abbr:string reamrk:string

rails g scaffold tuhu/detail version_id:integer url:string remark:string  state:integer:index 

rails g scaffold tuhu/prodoct detail_id:integer kind_id:integer name:string price:string category:string   url:string remark:string  
rails g scaffold tuhu/product  kind_id:integer  img:string name:string price:string category:string   url:string remark:string  