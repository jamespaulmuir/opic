class UsersController < ApplicationController
  require 'net/http'

  def show
    name_n = params[:name_n].to_s.strip.downcase
    params[:width]    ||= 100
    params[:aspect]   ||= 's'
    params[:default]  ||= default_url(params[:width], params[:aspect])
    user = User.find_or_create_by_name_n!(name_n)

    if user.avatars.present?
      @avatar = user.avatars.last
      picture = @avatar.picture.by_width_and_aspect(params[:width], params[:aspect])
      send_file picture.path, :filename => "#{name_n}.#{picture.path.split('.').last}", :disposition => 'inline'
    else
      redirect_to user.avatar_url(params.slice(:default, :width, :aspect))
    end

  rescue StandardError => e
    puts e.inspect
    email = "#{name_n}@osu.edu"
    redirect_to "https://secure.gravatar.com/avatar/#{Digest::MD5.hexdigest(email).to_s.downcase}?s=#{params[:width]}&r=pg&d=mm"

  end

end
