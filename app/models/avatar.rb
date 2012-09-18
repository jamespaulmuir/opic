class Avatar < ActiveRecord::Base
  attr_accessible :picture
  belongs_to :user

  mount_uploader :picture, AvatarUploader
  process_in_background :picture
end
