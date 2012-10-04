class ApiController < ActionController::Metal

  include Apian::ControllerExtensions

  def create
    return forbidden unless service_id = Service.lookup_id_for(request.headers["X-API-Key"])
    user = User.find_or_create_by_name_n(params[:name_n])
    if user.opted_out?
      self.response_body = 'This user has opted out of the opic service.'
      self.status = 403
      return
    end
    @avatar = user.avatars.build(:picture => params[:avatar])
    @avatar.service_id = service_id

    if @avatar.save
      Egg.delay.notify('Picture Uploaded From API', Time.zone.now)
      self.response_body = ''
      self.status = 201
    else
      self.response_body = @avatar.errors.full_messages.join("\n")
      self.status = 400
    end

  end

end
