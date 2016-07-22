require 'carrierwave'
require 'active_support'

module CarrierWaveInstrumentation
  ProcessEventName = 'process.carrierwave'.freeze
  StoreEventName = 'store.carrierwave'.freeze
  DownloadEventName = 'download.carrierwave'.freeze

  def process!(*args, &block)
    sanitized_file = args[0]

    payload = {
      filename: sanitized_file.filename,
      original_filename: sanitized_file.original_filename,
      content_type: sanitized_file.content_type,
      size: sanitized_file.size,
      version: version_name || 'default',
      processors: self.class.processors.map {|processor| processor[0] }
    }
    ActiveSupport::Notifications.instrument(ProcessEventName, payload) do
      super *args, &block
    end
  end

  def store!(*args, &block)
    payload = {
      filename: filename,
      original_filename: original_filename,
      content_type: sanitized_file.content_type,
      size: sanitized_file.size,
      version: version_name || 'default'
    }
    ActiveSupport::Notifications.instrument(StoreEventName, payload) do
      super *args, &block
    end
  end

  def download!(*args, &block)
    uri = args[0]

    payload = {
      uri: uri
    }
    ActiveSupport::Notifications.instrument(DownloadEventName, payload) do
      super *args, &block
    end
  end

  CarrierWave::Uploader::Base.send :include, CarrierWaveInstrumentation
end
