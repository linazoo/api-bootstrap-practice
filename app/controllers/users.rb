post '/login' do
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    #   redirect '/index'
        "you've logged in!"
    else
    #   erb :main
    "log in didnt work"
    end 
end 

get '/users/new' do
    erb :new
end
  
post '/users/new' do 
    erb :index
end 