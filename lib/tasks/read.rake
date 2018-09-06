namespace :read do

@dir_A ="/home/chenwei/workspace/dc/tmp/ok"

  desc "read csv"
  task :csv => [:environment] do

        Dir.foreach(@dir_A) do |file|
        if file !="." and file !=".." and file != '.DS_Store'

            puts "read " + file

            file_name = "#{@dir_A}/#{file}"

            users = []

            File.open(file_name,"r") do |file|
                while line  = file.gets
                    arr  = line.to_s.split(",") #打印出文件内容

                    photo_num = arr[0]
                    uid  = arr[1]
                    photo_hash = arr[2].split("uid_hash=")[1].split("&")[0] rescue "--"
                    sign = 1

                    p photo_hash

                    # # UserJob.perform_later(uid, photo_num, photo_hash, sign)
                    # Dc::User.create!(
                    #   uid: uid,
                    #   photo_num: photo_num,
                    #   photo_hash: photo_hash,
                    #   sign: sign
                    # )

                    users <<  Dc::User.new(
                      uid: uid,
                      photo_num: photo_num,
                      photo_hash: photo_hash,
                      sign: sign
                    )

                end
            end

            Dc::User.import users    # or use import!
        end
      end
  end



  desc "summary"
  task :count => [:environment] do


    # file = "/home/chenwei/workspace/dc/tmp/ok/1451111,1461111.csv" #输出文件
    lists ={}
    Dc::User.each do |u|
      num = u.photo_num
      if lists[:"#{num}"].present?
        lists[:"#{num}"] = lists[:"#{num}"].to_i + 1
      else
        lists[:"#{num}"] =  1
      end
    end

  end

end
