require 'carrierwave/orm/activerecord'

class VideoUploader < CarrierWave::Uploader::Base
    storage :file
end