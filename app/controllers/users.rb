get '/login' do
    @error = "Invalid username or password" if params['e']
    @logout = "You're logged out" if params['lo']
    erb :login
end 


post '/login' do
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
        # "you've logged in!"
    else
        redirect '/?e=1'
    end 
end 


get '/users/new' do
    erb :new
end
  
post '/users/new' do 
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    if @user.valid? 
        @user.save!
        redirect "/users/#{@user.id}"
    else 
        redirect '/?e=1'
    end 
    erb :index
end 


get '/logout' do
    session[:user_id] = nil
    redirect '/?lo=1'
end

get '/users/:id' do
    @user = User.find(params[:id])
    erb :profile
end 