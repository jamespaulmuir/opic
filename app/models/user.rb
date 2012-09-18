class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :emplid, :name_n
  has_many :avatars

  include Gravtastic
  has_gravatar :secure => true

  def email
    "#{name_n}@osu.edu"
  end


end
