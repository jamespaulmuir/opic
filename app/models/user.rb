class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :name_n
  has_many :avatars

  require 'net/https'

  include Gravtastic
  has_gravatar :secure => true

  validates_uniqueness_of :name_n
  validates_format_of :name_n, :with => /\A[a-z]([a-z-]*[a-z])?\.[1-9]\d*\z/, :message => 'must be in format: name.#'

  def email
    "#{name_n}@osu.edu"
  end

  def has_gravatar?
    Rails.cache.fetch("has_gravatar_#{self.name_n}", :expires_in => 1.week) do
      url = URI(gravatar_url(:default => 404))
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = url.scheme == 'https'
      Net::HTTPOK === http.request_head("#{url.path}?#{url.query}") 
    end
  end

  def avatar_url(args = {})
    return args[:default] unless has_gravatar?

    if args[:aspect] == 's'
      delay.create_avatar_from_gravatar!
      gravatar_url(args)
    else
      avatar = create_avatar_from_gravatar!
      avatar.picture.by_width_and_aspect(args[:width], args[:aspect]).url 
    end
  end

  def create_avatar_from_gravatar!
    avatars.create!(:remote_picture_url => gravatar_url(:size => AvatarUploader.max_height))
  end

  #Overriding shib-rails.
  def self.find_or_create_from_shibboleth(identity)
    find_or_create_by_name_n(identity)
  end

end
