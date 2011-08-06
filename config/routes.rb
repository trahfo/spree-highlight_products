Rails.application.routes.draw do
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