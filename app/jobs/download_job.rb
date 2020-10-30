class DownloadJob < ApplicationJob
  queue_as :default

  # DownloadJob.perform_later(url, path)
  def perform(url, path)
    # Do something later
    System.download_image(url, path)
  end
end

