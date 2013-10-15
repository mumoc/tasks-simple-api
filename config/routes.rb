Tasks::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :tasks, only: [:create, :update, :destroy, :index]
  end
end
