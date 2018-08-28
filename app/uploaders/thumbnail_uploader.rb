class ThumbnailUploader < CarrierWave::Uploader::Base
 
  include CarrierWave::MiniMagick
 
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  version :medium do
    process :resize_to_fill => [300, 300]
  end
 
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end


