Rails3TrCheckout::Application.routes.draw do  
  
  resources :customer
  
  match 'payments/new' => 'payments#new', :as => :new_payment
  match 'payments/confirm' => 'payments#confirm', :as => :confirm_payment
  match 'payments/cancel' => 'payments#cancel', :as => :cancel_payment

  root :to => "payments#new"
  
  match '/', :to => 'payments#new'
  
end
