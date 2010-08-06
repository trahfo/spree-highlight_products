map.namespace :admin do |admin|
  admin.resources :products, :member => {:highlight => :post}
end