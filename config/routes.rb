BankOfMd::Application.routes.draw do

  root :to => 'home#index'

  get '/register' => 'register#new'
  post '/register' => 'register#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  get '/overview' => 'overview#index'

  get '/profile/new' => 'users#new'
  post '/profile/new' => 'users#create'
  get '/profile' => 'users#show'
  get '/profile/edit' => 'users#edit'
  put '/profile/edit' => 'users#update'


  get '/family' => 'family#index'
  get '/family/exists' => 'family#exists'
  get '/family/new' => 'family#new'
  post '/family/new' => 'family#create'
  get '/family/edit' => 'family#edit'
  put '/family/edit' => 'family#update'

  get '/chores' => 'chores#index'
  get '/chores/new' => 'chores#new'
  post '/chores/new' => 'chores#create'
  get '/chores/edit' => 'chores#edit'
  put '/chores/edit' => 'chores#update'

  get '/accounts' => 'accounts#index'
  get '/accounts/new' => 'accounts#new'
  post '/accounts/new' => 'accounts#create'
  get '/accounts/edit' => 'accounts#edit'
  put '/accounts/edit' => 'accounts#update'
  get '/accounts/start' => 'accounts#start'
  post '/accounts/start' => 'accounts#start_create'

  get '/transactions' => 'transactions#new'
  post '/transactions' => 'transactions#create'
  get '/transactions/edit' => 'transactions#edit'
  put '/transactions/edit' => 'transactions#update'
  get '/transactions/account' => 'transactions#account'
  post '/transactions/account' => 'transactions#account_create'

  get '/allowances/start' => 'allowances#start'
  post '/allowances/start' => 'allowances#start_create'

end
