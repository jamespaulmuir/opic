class AvatarsController < ApplicationController
  before_filter :require_shibboleth

  def new
    @current_avatar = current_user.avatars.last if current_user.avatars.present?
    @avatar = Avatar.new

    respond_to do |format|
      format.html
      format.json { render :json => @article }
    end
  end

  def show
    @avatar = current_user.avatars.last
  end

  def create
    @avatar = current_user.avatars.build(params[:avatar])
    @avatar.service = Service.find_by_name('opic')

    respond_to do |format|
      if @avatar.save
        Egg.delay.notify('Picture Uploaded', Time.zone.now)
        format.html { redirect_to @avatar, :notice => 'Avatar was successfully created.' }
        format.json { render :json => @avatar, :status => :created, :location => @avatar }
      else
        format.html { render :action => "new" }
        format.json { render :json => @avatar.errors, :status => :unprocessable_entity }
      end
    end
  end

end
