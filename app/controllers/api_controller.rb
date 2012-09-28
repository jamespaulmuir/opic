class ApiController < ActionController::Metal

  include Apian::ControllerExtensions

  def create
    return forbidden unless service_id = Service.lookup_id_for(api_key)
    user = User.find_or_create_by_name_n(params[:name_n])
    @avatar = user.avatars.build(params[:avatar])
    @avatar.service_id = service_id

    respond_to do |format|
      if @avatar.save
        Egg.delay.notify('Picture Uploaded From API', Time.zone.now)
        format.json { render :json => @avatar, :status => :created, :location => @avatar }
      else
        format.html { render :action => "new" }
        format.json { render :json => @avatar.errors, :status => :unprocessable_entity }
      end
    end
  end

end
