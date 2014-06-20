class Cache
  def self.core_types
    %w(
      ProductType
      Country
      PropertyType
      VehicleType
      PaymentType
      Location
      PassengerType
      Region
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
    core_types.each { |key| QuickTravel::Cache.cache_store.delete("QuickTravel::#{key}.all") }
  end

  def self.clear_other
    other_types.each { |key| QuickTravel::Cache.cache_store.delete_matched /#{key}_*/ }
  end
end
