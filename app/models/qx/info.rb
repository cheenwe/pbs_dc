class Qx::Info < ApplicationRecord

    # Qx::Info.new.liuliang(date)
    def liuliang(date)

        @qx_infos = Qx::Info.all

        hash =""
        (0..23).each do |hour|
        up_size = Qx::Info.where(up_at: ["#{date} #{hour}:00:00".."#{date} #{hour}:59:59"]).size
        down_size = Qx::Info.where(down_at: ["#{date} #{hour}:00:00".."#{date} #{hour}:59:59"]).size
        str = "#{date} #{hour}:00:00 ,#{up_size} ,#{down_size} \n" 

        hash = hash + str  if up_size!= 0 ||down_size!= 0
        end
    
        return hash
    end


    # Qx::Info.new.time_a
    def time_a
        (Date.parse("2017-07-01")..Date.parse("2019-08-03")).each do |date|
            res = Qx::Info.new.liuliang(date)
            write_csv(res)
        end
    end

    # Qx::Info.new.write_csv("111")
    def write_csv(res)
        file = "#{Rails.root}/tmp/liuliang.csv"
        File.open(file,"a+") do |f|
            f.puts res
        end
    end
end
