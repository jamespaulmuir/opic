class Avatar < ActiveRecord::Base
  attr_accessible :picture, :remote_picture_url
  belongs_to :user

  mount_uploader :picture, AvatarUploader
  process_in_background :picture
end
