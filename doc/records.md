## 兼职信息

rails g scaffold jz/user code:string name:string phone:string alipay:string rate:integer remark:string this_month_num:integer
rails db:migrate 

rails g scaffold jz/record user_id:integer enter_at:datetime is_first:boolean computer_num:integer remark:string
rails db:migrate 
rails d scaffold jz/record

rails g scaffold jz/sx user_id:integer name:string start_at:datetime end_at:datetime
rails db:migrate 
