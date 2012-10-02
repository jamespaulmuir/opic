class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from AvatarUploader::InvalidImageRequest do |exception|
    render :text => "Invalid Image Request: #{exception.message}", :status => 404
  end

  helper_method :default_url

  private

  def default_url(width = 250, aspect ='p')
    params[:default] || "#{root_url}assets/#{aspect}#{width}_brutus_buckeye.png"
  end

end
