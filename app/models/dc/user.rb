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

  # sign = 1 #世纪佳缘
  def photo_url
    case sign
    when 1
      "http://photo.jiayuan.com/showphoto.php?uid_hash=#{photo_hash}&tid=0&cache_key="
    end

  end
end
