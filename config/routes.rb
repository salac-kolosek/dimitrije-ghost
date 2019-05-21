Rails.application.routes.draw do
  resources :search_suggestions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :stories
  resources :blog, only: [ :index, :show ]
  
  get 'team', action: :index, controller: 'team'
  get 'tags/:tag', to: 'articles#index', as: :tag


  devise_scope :user do
    authenticated :user do
      root 'stories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end
end
