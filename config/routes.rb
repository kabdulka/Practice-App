Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'pages#home'
    # root rout sends this request to the pages controller
    # Then a home function within the application controller will get executed
    # So, should write some code in the pages controller file
    
    get '/about', to: 'pages#about'
    # get or grab "this route and send it to the pages controller's about action"
    
    get '/help', to: 'pages#help'
    
    resources :todos
    ## The above line gives all the CRUD routes for todos

end
