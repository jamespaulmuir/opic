class Avatar < ActiveRecord::Base
  attr_accessible :picture, :remote_picture_url
  belongs_to :user
  belongs_to :service

  mount_uploader :picture, AvatarUploader
  process_in_background :picture

end
