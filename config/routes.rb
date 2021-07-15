Rails.application.routes.draw do
  
  get '/', to: "welcome#index"
  resources :orders, except: [:edit, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
