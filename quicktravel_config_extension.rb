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

    unless QuickTravel.config.url.start_with?("https")
      message = "ERROR: #{config_file} is configured to use HTTP. Please use HTTPS."
      error message
    end
  end
end
