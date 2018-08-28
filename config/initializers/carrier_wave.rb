require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.storage = Rails.configuration.carrierwave_storage
  config.dropbox_access_token = ENV["DROPBOX_ACCESS_TOKEN"]
end