class UsersController < ApplicationController

  def show
    @user = User.find_by_name_n(params[:name_n])

    if @user
      @avatar = @user.avatars.last
      send_file @avatar.picture.path
    else
      @user = User.new(:name_n => params[:name_n])
      redirect_to @user.gravatar_url(:default => params[:default] || default_url)
    end

  end

  private

  def default_url
    'https://advisingconnect.osu.edu/assets/default_brutus.png'
  end
end
