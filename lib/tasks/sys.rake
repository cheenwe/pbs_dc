namespace :sys do

  desc "export mysql db "
  task :export_mysql => [:environment] do
    config = Rails.configuration.database_configuration

    host = config[Rails.env]['host']
    database = config[Rails.env]['database']
    username = config[Rails.env]['username']
    password = config[Rails.env]['password']

    export_sql_file = "#{Rails.root}/tmp/#{database}-#{Time.now.to_i}.sql"
    commands = "mysqldump -u#{username} -p#{password} #{database} > #{export_sql_file}"

    p "start export.. \n"
    system(commands)
    p "success export! \n"
    p export_sql_file

 end


 
  desc "export mysql db "
  task :user => [:environment] do
    file_name = "/home/ubuntu/桌面/1.csv"
    i=1
    File.open(file_name,"r") do |file|
      while line  = file.gets
        i = i+ 1
          arr  = line.to_s.strip().split(",") #打印出文件内容
          id = arr[0]
          name = arr[1]
          phone = arr[2]
          id_card = arr[3]
          alipay = arr[4]
          created_at = arr[5]
          this_month_num = arr[6]
          code = i
          Jz::User.create(
            name: name,
            phone: phone,
            id_card: id_card,
            alipay: alipay,
            created_at: created_at,
            this_month_num: this_month_num,
          ) 
      end
    end
  end


 
end
