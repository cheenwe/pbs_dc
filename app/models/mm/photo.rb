class Mm::Photo < ApplicationRecord
	def self.total_entries
		4005346
	end


  # default_scope { order('album_id DESC') }


  # # Mm::Photo.fix_id_with_album
  # def self.fix_id_with_album
  #   i = 0
  #   folder = "0"
  #   batch_size = 20

  #   download_path = "/disk4/data/mm/"
  #   # 循环相册
  #   Mm::Album.find_in_batches(batch_size: batch_size).each do |albums|
  #     current_folder = download_path+folder
  #     # system("mkdir -p #{current_folder}")

  #     albums.each do |album|
  #       p "======album====#{album.id}"
  #       # p album.id
  #       photos = album.photos
  #       photos.each do |item|
  #         # p item.id
  #         p i
  #         url = item.url
  #         name = System.gen_pic_name
  #         pic_name = current_folder+"/"+name
  #         pic_info = folder +"/"+name
  #         # p pic_name
  #         # item.update_columns(id:j_id, name: pic_info)
  #         # DownloadJob.perform_later(url, pic_name)
  #         #sleep((SecureRandom.rand))
  #         i = i + 1
  #         #sleep((SecureRandom.rand))
  #       end
  #     end
  #     folder = System.next_str(folder)
  #   end
  # end

  # Mm::Photo.download_all_pic(id=1)
  def self.download_all_pic(id=1,folder="00")
    download_path = "/disk2/backup/mm/"
    # download_path = "/tmp/mm/"
    batch_size = 5000
    # folder = "9F"
    # j_id = 1
    Mm::Photo.where("id >?", id).find_in_batches(batch_size: batch_size).each do |list|
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
        item.update_columns( name: pic_info)
        #PhotoUpdateJob.perform_later(item, pic_info)
        DownloadJob.perform_later(url, pic_name)
        #System.download_image(url, pic_name)
        # sleep(SecureRandom.rand)
       #j_id = j_id + 1/
      end
      # return
      # sleep((SecureRandom.rand).to_i)
      folder = System.gen_next(folder)
    end
  end

end
