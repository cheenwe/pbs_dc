class UserPhotoJob < ApplicationJob
  queue_as :default

  # UserPhotoJob.perform_later(uid, photo_num, photo_hash, sign, photos)
  def perform(uid, photo_num, photo_hash, sign, base_info, photos)
    # Do something later

    # Dc::User.create(
    #   uid: uid,
    #   photo_num: photo_num,
    #   photo_hash: photo_hash,
    #   sign: sign
    # )
    u = Dc::User.find_by(uid: uid)


    photo_hash = photo_hash.split("uid_hash=")[1] rescue photo_hash

    if u.nil?

      u = Dc::User.create(
        uid: uid,
        photo_num: photo_num,
        photo_hash: photo_hash,
        info: base_info,
        sign: sign
      )

      data = []
      photos.split(',').each do |photo|
        if photo != ''
          data << Dc::Photo.new(
            user_id: u.id,
            url: photo
          )
        end
      end
      Dc::Photo.import data

    else
      if u.info.present?
        p "*"*60
        p  u.uid

        p "info and photo exist!"
        p "*"*60
        unless u.photos.size > 0


          data = []
          photos.split(',').each do |photo|
            if photo != ''
              data << Dc::Photo.new(
                user_id: u.id,
                url: photo
              )
            end
          end
          Dc::Photo.import data
        end
      else

        u.update(
        photo_num: photo_num,
        # photo_hash: photo_hash,
        info: base_info,
        sign: sign
        )

        # p  u.id

          data = []
          photos.split(',').each do |photo|
            if photo != ''
              data << Dc::Photo.new(
                user_id: u.id,
                url: photo
              )
            end
          end
          Dc::Photo.import data


      end

    end


  end
end
