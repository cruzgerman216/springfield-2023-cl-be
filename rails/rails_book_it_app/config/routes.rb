Rails.application.routes.draw do
  resources :categories
  resources :books do 
    resources :reviews, except: [:show, :index]
  end
end
