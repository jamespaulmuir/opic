class PicturesController < ApplicationController
  require 'net/http'

  def index
    @pictures = Avatar.all
  end

  def show
    name_n = params[:name_n].to_s.strip.downcase
    hashed_name_n = params[:hash].to_s.strip.downcase
    params[:width]    ||= 100
    params[:aspect]   ||= 's'

    user = User.find_by_name_n(name_n) || User.find_by_hashed_name_n(hashed_name_n)

    if user && user.avatars.present?
      @avatar = user.avatars.last
      picture = @avatar.picture.by_width_and_aspect(params[:width], params[:aspect])
      send_file picture.path, :filename => "#{name_n}.#{picture.path.split('.').last}", :disposition => 'inline'
      Egg.delay.notify('OPIC Viewed', Time.zone.now)
    else
      redirect_to default_url(params[:width], params[:aspect])
    end

  rescue StandardError => e
    puts e.inspect
    redirect_to default_url(params[:width], params[:aspect])
  end

end
