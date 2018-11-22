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
end
