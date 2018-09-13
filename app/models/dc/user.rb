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

  # validates :uid, presence: true, uniqueness: true
  validates_uniqueness_of :uid, :scope => :sign
  # scope :jiayuan, ->{ where(sign:1) }
  # scope :baihe, ->{ where(sign:2) }


  # sign = 1 #世纪佳缘
  def photo_url
    case sign
    when 1
      "http://photo.jiayuan.com/showphoto.php?uid_hash=#{photo_hash}&tid=0&cache_key="
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
    Dc::User.all.each do |user|
      user.remove_repeat
    end

    # .eacj.map { |e| e.remove_repeat  }

  end

end
