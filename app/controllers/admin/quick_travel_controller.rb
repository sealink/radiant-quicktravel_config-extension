class Admin::QuickTravelController < ApplicationController
  def clear_core_caches
    Cache.clear_core
    flash[:notice] = 'Core Cache Cleared'
    redirect_to admin_quick_travel_index_path
  end

  def clear_other_caches
    Cache.clear_other
    flash[:notice] = 'Other Cache Cleared'
    redirect_to admin_quick_travel_index_path
  end
end
