# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
class QuicktravelConfigExtension < Radiant::Extension
  version "1.0"
  description "This extension ads admin area to manage quicktravel config"
  url ''


  def activate
    require 'quick_travel/cache'

    QuickTravel::Cache.cache_store = Rails.cache

    tab "Content" do
      add_item "QuickTravel", "/admin/quick_travel"
    end

    load_config
  end


  def deactivate
  end


  private


  def load_config
    @config_file_name = 'quicktravel'
    @configurator = QuickTravel

    return unless config_exists?

    configure

    if QuickTravel.config.url == 'mock'
      require 'quick_travel/mock'
      return
    else
      ensure_config_secure
    end
  end


  LOCAL_HOSTS = %w(localhost 0.0.0.0 127.0.0.1)

  def ensure_config_secure
    uri = URI.parse(QuickTravel.config.url)
    secure = uri.scheme == 'https'
    local_host = LOCAL_HOSTS.include?(uri.host)

    if !secure && !local_host
      message = "ERROR: #{config_file} is configured to use HTTP. Please use HTTPS."
      error message
    end
  end
end
