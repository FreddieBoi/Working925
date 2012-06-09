Working925::Application.routes.draw do

  devise_for :users

  resources :projects do
    resources :tasks
  end

  resources :reports

  # The root of the site
  root :to => "pages#home"

end
