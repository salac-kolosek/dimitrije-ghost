Rails.application.routes.draw do
  resources :search_suggestions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [ :index, :edit, :update ]
  resources :stories
  
  get 'team', action: :index, controller: 'team'
  get 'tags/:tag', to: 'articles#index', as: :tag

  # i need root page for devise, this will be changed later
  root 'users#index' 
end
