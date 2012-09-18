class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from AvatarUploader::InvalidImageRequest do |exception|
    render :text => "Invalid Image Request: #{exception.message}", :status => 404
  end

  helper_method :default_url

  private

  def default_url
    'https://advisingconnect.osu.edu/assets/default_brutus.png'
  end

end
