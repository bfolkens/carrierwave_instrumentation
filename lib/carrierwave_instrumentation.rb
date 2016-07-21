require 'carrierwave'
require 'active_support'

module CarrierWaveInstrumentation
  ProcessEventName = 'process.carrierwave'.freeze

  def process!(*args, &block)
    ActiveSupport::Notifications.instrument(ProcessEventName) do
      super
    end
  end

  CarrierWave::Uploader::Base.send :include, CarrierWaveInstrumentation
end
