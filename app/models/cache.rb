class Cache
  def self.core_types
    %w(
      all_product_types
      all_countries
      all_property_types
      all_vehicle_types
      all_payment_types
      all_locations
      all_passenger_types
      all_regions
    )
  end

  def self.other_types
    %w(
      any_exclusive_for
      allowed_client_type_ids
      trip_routes
      properties
      geocode
    )
  end

  def self.clear_core
    core_types.each { |key| QuickTravel::Cache.cache_store.delete(key) }
  end

  def self.clear_other
    other_types.each { |key| QuickTravel::Cache.cache_store.delete_matched /#{key}_*/ }
  end
end
