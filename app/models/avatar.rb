class Avatar < ActiveRecord::Base
  attr_accessible :picture, :remote_picture_url
  belongs_to :user
  belongs_to :service

  validates_presence_of :picture, :user_id, :service_id

  mount_uploader :picture, AvatarUploader
  process_in_background :picture


end
