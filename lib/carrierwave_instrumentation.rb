require 'carrierwave'
require 'active_support'

module CarrierWaveInstrumentation
  ProcessEventName = 'process.carrierwave'.freeze

  def process!(*args, &block)
    sanitized_file = args[0]

    payload = { filename: sanitized_file.filename, original_filename: sanitized_file.original_filename, content_type: sanitized_file.content_type, size: sanitized_file.size }
    ActiveSupport::Notifications.instrument(ProcessEventName, payload) do
      super *args, &block
    end
  end

  CarrierWave::Uploader::Base.send :include, CarrierWaveInstrumentation
end
