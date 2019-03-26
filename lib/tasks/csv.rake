namespace :csv do
  desc "province"
  task :province => [:environment] do
    file_name = "#{Rails.root}/tmp/city/province.csv"
    data = []
    File.open(file_name,"r") do |file|
        while line  = file.gets
            arr  = line.to_s.strip().split(",") #打印出文件内容
            # p arr[0], arr[1]
            data << Core::Province.new(
              code: arr[0],
              name: arr[1]
            ) if arr[0] != "code"
        end
    end
    Core::Province.import data    # or use import!
  end


  desc "city"
  task :city => [:environment] do
    file_name = "#{Rails.root}/tmp/city/city.csv"
    data = []
    File.open(file_name,"r") do |file|
        while line  = file.gets
            arr  = line.to_s.strip().split(",") #打印出文件内容
            # p arr[0], arr[1]
            data << Core::City.new(
              code: arr[0],
              name: arr[1],
              province_code: arr[2]
            ) if arr[0] != "code"
        end
    end
    Core::City.import data    # or use import!
  end

  desc "area"
  task :area => [:environment] do
    file_name = "#{Rails.root}/tmp/city/area.csv"
    data = []
    File.open(file_name,"r") do |file|
        while line  = file.gets
            arr  = line.to_s.strip().split(",") #打印出文件内容
            # p arr[0], arr[1]
            data << Core::Area.new(
              code: arr[0],
              name: arr[1],
              city_code: arr[2]
            ) if arr[0] != "code"
        end
    end
    Core::Area.import data    # or use import!
  end

  desc "street"
  task :street => [:environment] do
    file_name = "#{Rails.root}/tmp/city/street.csv"
    data = []
    File.open(file_name,"r") do |file|
        while line  = file.gets
            arr  = line.to_s.strip().split(",") #打印出文件内容
            # p arr[0], arr[1]
            data << Core::Street.new(
              code: arr[0],
              name: arr[1],
              area_code: arr[2]
            ) if arr[0] != "code"
        end
    end
    Core::Street.import data    # or use import!
  end

  desc "village"
  task :village => [:environment] do
    file_name = "#{Rails.root}/tmp/city/village.csv"
    data = []
    File.open(file_name,"r") do |file|
        while line  = file.gets
            arr  = line.to_s.strip().split(",") #打印出文件内容
            # p arr[0], arr[1]
            data << Core::Village.new(
              code: arr[0],
              name: arr[1],
              street_code: arr[2]
            ) if arr[0] != "code"
        end
    end
    Core::Village.import data    # or use import!
  end

end
