class Monitor::Info < ApplicationRecord
	self.table_name = 'monitor_infos'
	belongs_to :server, class_name: "Monitor::Server"
end
