class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :emplid, :name_n
  has_many :avatars


end
