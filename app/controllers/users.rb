

post '/login' do
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/profile'
        # "you've logged in!"
    else
        redirect '/?e=1'
    end 
end 

get '/users/new' do
    erb :new
end
  
post '/users/new' do 
    user = User.create
    erb :index
end 

get '/logout' do
    session.delete(user_id: session[:username])
    redirect '/?lo=1'
end 