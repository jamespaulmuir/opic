class Service < ActiveRecord::Base
  attr_accessible :name
  has_many :avatars

  include Apian::ModelExtensions
end
