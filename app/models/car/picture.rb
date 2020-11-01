class Car::Picture < ApplicationRecord
    belongs_to :item


  # Car::Picture.download_all_pic
  def self.download_all_pic
    download_path = "/disk4/data/cars/"
    batch_size = 5000
    start_id = 1147600
    folder = "3s"
    Car::Picture.where("id >?", start_id).find_in_batches(batch_size: batch_size).each do |list|
      current_folder = download_path+folder
      system("mkdir -p #{current_folder}")

      list.each do |item|
        p item.id
        url = item.url
        name = System.gen_pic_name
        pic_name = current_folder+"/"+name
        pic_info = folder +"/"+name
        # p pic_name
        # p url
        item.update_columns(imgpath: pic_info)
        DownloadJob.perform_later(url, pic_name)

      #sleep((SecureRandom.rand))
      end
      # return
      sleep((SecureRandom.rand*10).to_i)
      folder = System.gen_next(folder)
    end
  end


end
