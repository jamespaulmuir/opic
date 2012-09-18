# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include ::CarrierWave::Backgrounder::Delay

  class InvalidImageRequest < StandardError
  end

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

  ASPECTS = ['p', 's']
  WIDTHS = (50..400).step(50)

  ASPECTS.each do |aspect|
    WIDTHS.each do |width|
      version "#{aspect}#{width}" do
        process :resize_to_fill => [width, (width * 4.0 / 3.0).to_i]
      end
    end
  end

  def by_width_and_aspect(width, aspect)
    width ||= 100
    aspect ||= 's'
    width = width.to_i
    puts "Width" + width.to_s

    if (WIDTHS.include? width) && (ASPECTS.include? aspect)
      send "#{aspect}#{width}"
    else
      raise InvalidImageRequest.new("Valid sizes are: #{WIDTHS.to_s[1..-2]}. Valid aspects are: #{ASPECTS.to_s[1..-2]}.")
    end
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
