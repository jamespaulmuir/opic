class User < ActiveRecord::Base
  authenticated_by_shibboleth
  attr_accessible :name_n
  has_many :avatars

  include Gravtastic
  has_gravatar :secure => true

  validates_uniqueness_of :name_n
  validates_format_of :name_n, :with => /\A[a-z]([a-z-]*[a-z])?\.[1-9]\d*\z/, :message => 'must be in format: name.#'

  def email
    "#{name_n}@osu.edu"
  end

  def has_gravatar?
    Rails.cache.fetch("has_gravatar_#{self.name_n}") do
      @url = URI(gravatar_url)
      @http = Net::HTTP.new(@url.host, @url.port)
      @http.use_ssl = @url.scheme == 'https'
      @http.head(@url.path) === Net::HTTPOK
    end
  end

  def avatar_url(args = {})
    if has_gravatar?
      gravatar_url(args)
    else
      args[:default]
    end
  end

  #Overriding shib-rails.
  def self.find_or_create_from_shibboleth(identity)
    find_or_create_by_name_n(identity)
  end

end
