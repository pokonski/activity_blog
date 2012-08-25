ActivityBlog::Application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts do
    resources :comments, only: [:create, :update, :edit, :destroy]
  end

  get "/feed" => "activities#feed", as: :feed
  get "/yours" => "activities#yours", as: :your_actions

  get "/:slug" => "posts#blog", as: :blog

  root :to => "posts#index"
end
