Opic::Application.routes.draw do

  resources :avatars

  get "/users/:name_n" => "users#show", :constraints => {:name_n => /\D+\.\d+/ }
  get '/:name_n'       => 'users#show', :constraints => {:name_n => /\D+\.\d+/ }

  root :to => 'avatars#new'


end
