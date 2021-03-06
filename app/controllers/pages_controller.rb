class PagesController < ApplicationController

  def developers; end

  def faq
    render layout: 'manage'
  end

  def about
    @collaborators_hash = Hash[*`git log --pretty=format:"%ae\n%an"`.split("\n")].sort_by{|e,n| e}.select{|e,n| e.ends_with?('@osu.edu')} 
  end

end