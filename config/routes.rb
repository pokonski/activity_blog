ActivityBlog::Application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts do
    resources :comments, only: [:create, :update, :edit, :destroy]
  end


  get "/feed" => "activities#feed", as: :feed
  get "/feed/fetch" => "activities#show", as: :fetch_activity

  get "/yours" => "activities#yours", as: :your_actions

  get "/:nickname" => "users#show", as: :user

  root :to => "posts#index"
end
