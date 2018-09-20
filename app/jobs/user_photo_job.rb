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

    if u.nil?

      u = Dc::User.create(
        uid: uid,
        photo_num: photo_num,
        photo_hash: photo_hash,
        info: base_info,
        sign: sign
      )

      photos.split(',').each do |photo|
        if photo != ''
          Dc::Photo.create(
            user_id: u.id,
            url: photo
          )
        end
      end


    else
      if u.info.present?
        p "*"*60
        p  u.uid

        p "info and photo exist!"
        p "*"*60
        unless u.photos.size > 0

          photos.split(',').each do |photo|
            if photo != ''
              Dc::Photo.create(
                user_id: u.id,
                url: photo
              )
            end
          end
        end
      else

        u.update(
        photo_num: photo_num,
        # photo_hash: photo_hash,
        info: base_info,
        sign: sign
        )

        # p  u.id

        photos.split(',').each do |photo|
          if photo != ''
            Dc::Photo.create(
              user_id: u.id,
              url: photo
            )
          end
        end

      end

    end


  end
end
