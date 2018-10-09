# == Schema Information
#
# Table name: dc_users
#
#  id         :integer          not null, primary key
#  uid        :string
#  photo_num  :integer
#  photo_hash :string
#  sign       :string
#  info       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dc::User < ApplicationRecord

  has_many :photos, class_name: "Dc::Photo", :dependent => :destroy
  # validates :uid, presence: true, uniqueness: true
  validates_uniqueness_of :uid, :scope => :sign
  # scope :jiayuan, ->{ where(sign:1) }
  # scope :baihe, ->{ where(sign:2) }


  # sign = 1 #世纪佳缘
  def photo_url
    case sign
    when 1
      "http://photo.jiayuan.com/showphoto.php?uid_hash=#{photo_hash}"
    end
  end

  def remove_repeat
    users = Dc::User.where(uid: self.uid)
    total = users.size
    if total > 1
      uids = users.last(total-1).map { |e| e.uid  }

      Dc::User.where(uid: uids).delete_all

      p "#{self.uid}...#{total}"
    else
    end
  end
  # Dc::User.new.check_all_repeat
  def check_all_repeat
    Dc::User.where(info:nil, has_photo:nil).find_in_batches(batch_size: 1000).each do |list|
      list.each do |user|
        user.remove_repeat
      end
    end

    # .eacj.map { |e| e.remove_repeat  }

  end
  def check_photo_hash
    if photo_hash.size > 32
      photo_hash
    else
      photo_url
    end

  end

  def base_info
    {
      uid: uid,
      photo_num: photo_num,
      photo_hash: check_photo_hash,
    }
  end

end
