Opic::Application.routes.draw do

  resources :avatars
  
  post '/use_gravatar'  => 'avatars#use_gravatar'

  put '/opt_out'      =>  'users#opt_out'
  put '/opt_in'       =>  'users#opt_in'

  root :to => 'avatars#new'

  get '/developers' => 'pages#developers'
  get '/faq' => 'pages#faq'
 
  post '/api/avatars' => 'api#create'

  get '/crazy'        => 'pictures#index'

  get '/:name_n'       => 'pictures#show', :constraints => {:name_n => /\D+\.\d+/ }
  get '/:hash'         => 'pictures#show'


end
