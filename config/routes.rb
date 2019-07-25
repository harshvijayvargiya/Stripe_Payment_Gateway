Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  resources :credit_cards
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'billing#index', as: :billing
  get '/card/new' => 'billing#new_card', as: :add_payment_method
  post "/card" => "billing#create_card", as: :create_payment_method
  get '/success' => 'billing#success', as: :success
  post '/subscription' => 'billing#subscribe', as: :subscribe
  get 'thanks', to: 'charges#thanks', as: 'thanks'



  # root to: 'products#index'
 
  # devise_for :users
 
  resources :charges, only: [:new, :create]
  resources :posts
  root to: 'posts#index'
 
  # mount StripeEvent::Engine, at: '/payments'

end
