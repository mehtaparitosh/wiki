Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    member do
      put "like", to: "articles#upvote"
    end
    resources :comments do
      member do
        put "like", to: "comments#upvote"
      end
    end
  end

  root 'articles#index'
end
