WebsiteBuilderEngine::Engine.routes.draw do
  
  resources :offerpages do
    get 'publish', :on => :member
  end

  resources :articles do
    get 'publish', :on => :member
  end

  resources :settings, :except => [:index, :destroy] do
    get 'publish', :on => :member
  end
  
  root :to => "home#index"
  
end
