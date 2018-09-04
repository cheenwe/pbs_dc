class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def uuid
    return SecureRandom.uuid.gsub('-', '')
  end
end
