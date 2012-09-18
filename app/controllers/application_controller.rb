class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from AvatarUploader::InvalidImageRequest do |exception|
    render :text => "Invalid Image Request: #{exception.message}", :status => 404
  end
end
