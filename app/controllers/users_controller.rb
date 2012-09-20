class UsersController < ApplicationController

  def show
    name_n = params[:name_n].downcase
    @user = User.find_by_name_n(name_n)

    if @user.present? && @user.avatars.present?
      @avatar = @user.avatars.last
      picture = @avatar.picture.by_width_and_aspect(params[:width], params[:aspect])
      send_file picture.path, :filename => "#{name_n}.#{picture.path.split('.').last}", :disposition => 'inline'
    else
      @user = User.new(:name_n => name_n)
      width = params[:width] || 100
      redirect_to @user.gravatar_url(:default => params[:default] || default_url, :size => width)
    end

  rescue
    email = "#{params[:name_n].strip.downcase}@osu.edu"
    redirect_to "https://secure.gravatar.com/avatar/#{Digest::MD5.hexdigest(email).to_s.downcase}?s=#{params[:width] || 100}&r=pg"

  end

end
