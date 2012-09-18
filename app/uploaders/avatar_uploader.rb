# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include ::CarrierWave::Backgrounder::Delay

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  #include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Resize original
  process :resize_to_fit => [533,533]

  version :s50 do
    process :resize_to_fill => [50,50]
  end

  version :s100 do
    process :resize_to_fill => [100,100]
  end

  version :s150 do
    process :resize_to_fill => [150,150]
  end

  version :s200 do
    process :resize_to_fill => [200,200]
  end

  version :s250 do
    process :resize_to_fill => [250,250]
  end

  version :s300 do
    process :resize_to_fill => [300,300]
  end

  version :s350 do
    process :resize_to_fill => [350,350]
  end

  version :s400 do
    process :resize_to_fill => [400,400]
  end

  version :p50 do
    process :resize_to_fill => [50,66]
  end

  version :p100 do
    process :resize_to_fill => [100,133]
  end

  version :p150 do
    process :resize_to_fill => [150,200]
  end

  version :p200 do
    process :resize_to_fill => [200,266]
  end

  version :p250 do
    process :resize_to_fill => [250,333]
  end

  version :p300 do
    process :resize_to_fill => [300,400]
  end

  version :p350 do
    process :resize_to_fill => [350,466]
  end

  version :p400 do
    process :resize_to_fill => [400,533]
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
