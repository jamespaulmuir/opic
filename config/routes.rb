Opic::Application.routes.draw do

  resources :avatars

  get '/:name_n'       => 'users#show', :constraints => {:name_n => /\D+\.\d+/ }

  post '/use_gravatar'  => 'avatars#use_gravatar'

  root :to => 'avatars#new'

  get '/developers' => 'pages#developers'
 
  post '/api/avatars' => 'api#create'

  get '/:hash'         => 'users#show'

end
