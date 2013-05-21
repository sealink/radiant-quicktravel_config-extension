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
  end


  def deactivate
  end
end
