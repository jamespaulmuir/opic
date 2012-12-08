Opic::Application.routes.draw do

  get '/:name_n' => 'pictures#show', :constraints => {:name_n => /\D+\.\d+/ }
  get '/:hash'   => 'pictures#show'

  root :to => 'avatars#new'

  resources :avatars

  post '/use_gravatar'  => 'avatars#use_gravatar'

  put '/opt_out'      =>  'users#opt_out'
  put '/opt_in'       =>  'users#opt_in'

  %w{ developers faq about }.each do |page|
    get "/#{page}" => "pages##{page}"
  end

  post '/api/avatars' => 'api#create'

  get '/crazy' => 'pictures#index' unless Rails.env.production?

end
