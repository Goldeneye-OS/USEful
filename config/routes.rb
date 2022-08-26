Rails.application.routes.draw do
  resources :sessions do
		collection do
			post :start
			get :signin
		end
  end
  
  resources :users do
		collection do
			get :current_user_data
		end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # sessions
  post '/login', to: "sessions#create"
end
