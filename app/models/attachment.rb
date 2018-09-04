class Attachment < ApplicationRecord
	# 短域名服务：
	# POST http://dwz.cn/admin/create?
	# {"url":"http://192.168.100.10:3000/api/v1/index.html"}:


	scope :with_eager_loaded_images, -> { eager_load(attachments_attachments: :blob) }

	has_one_attached :image, dependent: :destroy
	has_many_attached :attachments, dependent: :destroy

	before_create :generate_uuid
	after_update :generate_info

	def generate_uuid
		self.uuid = uuid
	end

	# qrcord/ zip_url/ short_url
	def generate_info

	end
end
