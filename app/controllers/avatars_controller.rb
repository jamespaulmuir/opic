class AvatarsController < ApplicationController

  def new 
    @avatar = Avatar.new
  end


end
