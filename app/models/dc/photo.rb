# == Schema Information
#
# Table name: dc_photos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dc::Photo < ApplicationRecord
  belongs_to :user, class_name: "Dc::User", foreign_key: :user_id
end
