## 获取公司链接
rails g scaffold tyc/cid city_id:integer state:integer number:string 
rails db:migrate 

## 公司

字段名   |   参数   |  类型  |  说明
-------------------------------------

序号        code             string
公司logo    logo             string
公司名称     name             string
公司曾用名   old_name         string
电话        phone            string
邮箱        mail             string
网址        url              string
地址        address          string
简介        intro            string
更新时间     update_date      date
法人        boss_name        string
注册资本     reg_money        string
成立日期     set_date         string
经营状态     status           string
工商注册号    reg_number       string
统一社会信用代码 credit_code    string
组织机构代码    company_code   string
纳税人识别号   tax_code        string
公司类型      category_id     integer
营业期限      end_time        string
行业         industry_id     integer
纳税人资质    tax              string
核准日期      allow_time       string
实缴资本      pay_money        string
人员规模      all_people       string
参保人数      insured_people   string
登记机关      organ            string
注册地址      reg_address      string
英文名称      en_name          string
经营范围      operate_scope    string


rails g scaffold tyc/company code:string logo:string name:string old_name:string phone:string mail:string url:string address:string intro:string update_date:date boss_name:string reg_money:string set_date:string status:string reg_number:string credit_code:string company_code:string tax_code:string category_id:integer end_time:string industry_id:integer tax:string allow_time:string pay_money:string all_people:string insured_people:string organ:string reg_address:string en_name:string operate_scope:string


## 行业

tyc/city

name:string

rails g model tyc/city  name:string

## 行业

tyc/industry

name:string


## 公司类型

tyc/category

name:string


## 主要人员

tyc/human

company_id:integer
name:string
code:string
job:string


## 股东信息

tyc/gudong

company_id:integer
human_id:integer
invest_rate:string
invest_amount:string


##对外投资

tyc/investe_abroad

company_id:integer
abroadd_company_id:integer


##添加字段
方法一
rails g migration AddCityIdToTycCompanies

方法二
rails g migration add_used_to_tyc_companies  used:integer

rails db:migrate 

default:0

##更新字段
Tyc::Company.update_all(used:0)


## 途虎保养数据
车辆品牌
车辆型号
具体子品牌

保养产品信息



rails g scaffold tuhu/brand name:string logo:string abbr:string reamrk:string 

rails g scaffold tuhu/version brand_id:integer:index name:string abbr:string reamrk:string

rails g scaffold tuhu/detail version_id:integer url:string remark:string  state:integer:index 

rails g scaffold tuhu/product  kind_id:integer  img:string name:string price:string category:string   url:string remark:string  

# 保存用户 cookie

rails g scaffold dc/cookie city_id:integer state:integer number:string 
