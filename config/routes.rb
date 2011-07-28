Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      member do
        get 'highlight'
        get 'unhighlight'
      end
    end
  end
end
