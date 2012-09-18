class UsersController < ApplicationController

  def show
    name_n = params[:name_n].downcase
    @user = User.find_by_name_n(name_n)

    if @user.present? && @user.avatars.present?
      @avatar = @user.avatars.last
      send_file @avatar.picture.by_width_and_aspect(params[:width], params[:aspect]).path
    else
      @user = User.new(:name_n => name_n)
      redirect_to @user.gravatar_url(:default => params[:default] || default_url)
    end

  end

end
