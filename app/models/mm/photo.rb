class Mm::Photo < ApplicationRecord



  default_scope { order('album_id DESC') }

  # Mm::Photo.download_all_pic
  def self.download_all_pic
    download_path = "/disk4/data/mm/"
    batch_size = 5000
    folder = "00"
    j = 1
    Mm::Photo.find_in_batches(batch_size: batch_size).each do |list|
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
        item.update_columns(id:j_id, name: pic_info)
        DownloadJob.perform_later(url, pic_name)

        #sleep((SecureRandom.rand))
       j_id = j_id + 1
      end
      # return
      sleep((SecureRandom.rand).to_i)
      folder = System.gen_next(folder)
    end
  end

end
