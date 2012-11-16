Opic::Application.routes.draw do

  resources :avatars
  
  post '/use_gravatar'  => 'avatars#use_gravatar'

  put '/opt_out'      =>  'users#opt_out'
  put '/opt_in'       =>  'users#opt_in'

  root :to => 'avatars#new'

  %w{ developers faq about }.each do |page|
    get "/#{page}" => "pages##{page}"
  end
 
  post '/api/avatars' => 'api#create'

  get '/crazy'        => 'pictures#index'

  get '/:name_n'       => 'pictures#show', :constraints => {:name_n => /\D+\.\d+/ }
  get '/:hash'         => 'pictures#show'


end
