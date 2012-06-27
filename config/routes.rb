Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :products do
      member do
        get 'highlight'
        get 'unhighlight'
      end
      collection do
        delete 'highlighted'
      end
    end
  end
end