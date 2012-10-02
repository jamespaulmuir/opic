class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :name_n
  has_many :avatars

  require 'net/https'

  include Gravtastic
  has_gravatar :secure => true

  before_create :hash_the_name_n
  validates_uniqueness_of :name_n
  validates_format_of :name_n, :with => /\A[a-z]([a-z-]*[a-z])?\.[1-9]\d*\z/, :message => 'must be in format: name.#'

  def email
    "#{name_n}@osu.edu"
  end

  def has_gravatar?
    url = URI(gravatar_url(:default => 404))
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = url.scheme == 'https'
    Net::HTTPOK === http.request_head("#{url.path}?#{url.query}") 
  end

  def create_avatar_from_gravatar!
    avatar = avatars.build(:remote_picture_url => gravatar_url(:size => AvatarUploader.max_height))
    avatar.service = Service.find_by_name('gravatar')
    avatar.save!
  end

  #Overriding shib-rails.
  def self.find_or_create_from_shibboleth(identity)
    find_or_create_by_name_n(identity)
  end

  private

  def hash_the_name_n
    self.hashed_name_n = Digest::MD5.hexdigest(self.name_n).downcase
  end

end
