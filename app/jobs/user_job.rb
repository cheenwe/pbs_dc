class UserJob < ApplicationJob
  queue_as :default

  # UserJob.perform_later(uid, photo_num, photo_hash, sign)
  def perform(uid, photo_num, photo_hash, sign)
    # Do something later

    photo_hash = photo_hash.split("uid_hash=")[1] rescue photo_hash  

    
    Dc::User.create(
      uid: uid,
      photo_num: photo_num,
      photo_hash: photo_hash,
      sign: sign
    )
  end
end
