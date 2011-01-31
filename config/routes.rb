Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      member do
        post 'highlight'
        post 'unhighlight'
      end
    end
  end
end

