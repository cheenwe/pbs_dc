class PhotoUpdateJob < ApplicationJob
  queue_as :default

  # PhotoUpdateJob.perform_later(item, url)
  def perform(item, url)
    # Do something later
    item.update_columns(name: url)
  end
end
