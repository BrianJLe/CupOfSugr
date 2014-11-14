Reservester::Application.routes.draw do

  resources :categories
  match '/owner_dashboard', to: 'users#owner_dashboard', via: 'get', :as => :owner_dashboard
  match '/my-stars', to: 'users#my-stars', via: 'get',:as => :my_stars
  devise_for :users
  resources :restaurants do
    resources :reservations
    resources :stars, :only => ['new', 'create']
    put :star, on: :member
  end
  resources :reservations
  #root to: "restaurants#index"
  root :to => 'root#root'

end
