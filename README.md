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
