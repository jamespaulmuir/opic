class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :avatar, :emplid, :name_n

  mount_uploader :avatar, AvatarUploader

end
