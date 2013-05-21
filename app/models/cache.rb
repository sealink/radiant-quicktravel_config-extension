class Cache
  def self.clear_core
    caches = %w(all_product_types all_countries all_property_types all_vehicle_types all_payment_types all_locations all_passenger_types all_regions)
    caches.each { |cache| QuickTravel::Cache.cache_store.delete(cache) }
  end

  def self.clear_other
    QuickTravel::Cache.cache_store.delete_matched /any_exclusive_for_*/
    QuickTravel::Cache.cache_store.delete_matched /allowed_client_type_ids_*/
    QuickTravel::Cache.cache_store.delete_matched /trip_routes_*/
    QuickTravel::Cache.cache_store.delete_matched /properties_*/
  end
end
