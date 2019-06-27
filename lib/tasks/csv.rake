require 'csv'
require 'fileutils'

namespace :csv do
  desc "province"
  task :old => [:environment] do

    csv_path = "/home/ubuntu/workspace/Enterprise-Registration-Data-of-Chinese-Mainland/csv"

    Dir.foreach(csv_path) do |csv_year|
        if csv_year !="." and csv_year !=".."

            csv_year_path = csv_path + "/" + csv_year

            Dir.foreach(csv_year_path) do |csv_file|
                if csv_file !="." and csv_file !=".."

                    file_path = csv_year_path + "/" + csv_file
                    datas = []

                    File.open(file_path,"r") do |file|
                      while line  = file.gets
                          row  = line.to_s.delete("\n").split(",") #打印出文件内容
                          if row[0] != "企业名称"

                            name = row[0][0..254]  # 企业名称
                            code = row[1][0..254]  # 统一社会信用代码
                            registrationDay = row[2][0..254]  # 注册日期
                            character = row[3][0..254]  # 企业类型
                            legalRepresentative = row[4][0..254]  # 法人代表
                            capital = row[5][0..254]  # 注册资金
                            businessScope = row[6][0..254]  # 经营范围
                            province = row[7][0..254]  # 所在省份
                            city = row[8][0..254]  # 地区
                            address = row[9][0..254]  # 注册地址


                            datas << Cn::Company.new(
                                name: name,
                                code: code,
                                regdate: registrationDay,
                                c_type: character,
                                boss: legalRepresentative,
                                capital: capital,
                                business_scope: businessScope,
                                province: province,
                                city: city,
                                address: address,
                            )
                          end
                      end
                    end
                    Cn::Company.import datas

                end
            end
        end
    end
  end




    desc "province"
    task :read => [:environment] do

        csv_path = "/data/Enterprise-Registration-Data-of-Chinese-Mainland/csv"
        s = Time.now

        Dir.foreach(csv_path) do |csv_year|
            if csv_year !="." and csv_year !=".."

                csv_year_path = csv_path + "/" + csv_year

                Dir.foreach(csv_year_path) do |csv_file|
                    if csv_file !="." and csv_file !=".."
                        file_path = csv_year_path + "/" + csv_file
                        p "====================================================================: #{file_path}"
                        datas = []
                        CSV.foreach("#{file_path}", {:headers=>true}) do |row|
                            record = {
                                name:  row[0],  # 企业名称
                                code:  row[1],  # 统一社会信用代码
                                registrationDay:  row[2],  # 注册日期
                                character:  row[3],  # 企业类型
                                legalRepresentative:  row[4],  # 法人代表
                                capital:  row[5],  # 注册资金
                                businessScope:  row[6],  # 经营范围
                                province:  row[7],  # 所在省份
                                city:  row[8],  # 地区
                                address:  row[9],  # 注册地址
                            }
                            datas << Cn::Company.new(record)
                        end
                        Cn::Company.import datas

                        FileUtils.rm file_path
                    end
                end

            end
        end

        p "used time: #{Time.now - s } s"
        p "total size: 5888641"
    end



end
