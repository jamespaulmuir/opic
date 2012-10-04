class UsersController < ApplicationController
  before_filter :require_shibboleth

  def opt_out
    current_user.opt_out!
    redirect_to root_url, :notice => "You have successfully opted out."
  end

end
