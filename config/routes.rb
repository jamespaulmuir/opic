Opic::Application.routes.draw do

  resources :avatars
  
  post '/use_gravatar'  => 'avatars#use_gravatar'

  put '/opt_out'      =>  'users#opt_out'

  root :to => 'avatars#new'

  get '/developers' => 'pages#developers'
 
  post '/api/avatars' => 'api#create'

  get '/crazy'        => 'pictures#index'

  get '/:name_n'       => 'pictures#show', :constraints => {:name_n => /\D+\.\d+/ }
  get '/:hash'         => 'pictures#show'


end
