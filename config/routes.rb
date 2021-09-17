Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Coprl::Presenters::Rails::Engine => "/"
  resources :blog_posts
end
