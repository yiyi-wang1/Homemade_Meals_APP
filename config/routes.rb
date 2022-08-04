Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :meals
  resources :users, only:[:create, :new, :show]

  get 'users/:id/admin_panel', to: 'users#admin_panel', as: :show_admin_panel_user

end
