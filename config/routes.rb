Opic::Application.routes.draw do

  resources :avatars

  get '/:name_n'       => 'users#show', :constraints => {:name_n => /\D+\.\d+/ }

  root :to => 'avatars#new'

  get '/developers' => 'pages#developers'
 
  post 'api/avatars' => 'api#create'

end
