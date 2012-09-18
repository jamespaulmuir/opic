class AvatarsController < ApplicationController
  before_filter :require_shibboleth

  def new
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

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar, :notice => 'Avatar was successfully created.' }
        format.json { render :json => @avatar, :status => :created, :location => @avatar }
      else
        format.html { render :action => "new" }
        format.json { render :json => @avatar.errors, :status => :unprocessable_entity }
      end
    end
  end

end
