ActionController::Routing::Routes.draw do |map|
  map.namespace :admin, :member => { :remove => :get } do |admin|
    admin.resources :quick_travel, :collection => {:clear_core_caches => :post, :clear_other_caches => :post}
  end
end

