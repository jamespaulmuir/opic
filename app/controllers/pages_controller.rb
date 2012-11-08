class PagesController < ApplicationController

  def developers; end

  def faq
    render layout: 'manage'
  end

end