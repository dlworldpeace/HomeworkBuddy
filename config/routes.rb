Rails.application.routes.draw do
  resources :categories
  get 'welcome/index'


resources :articles
root 'welcome#index' 
end
