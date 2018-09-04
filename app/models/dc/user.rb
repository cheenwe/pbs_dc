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
end
