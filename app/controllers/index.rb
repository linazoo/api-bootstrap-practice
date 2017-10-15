get '/' do
  @error = "Invalid username or password" if params['e']
  @logout = "You're logged out" if params['lo']
  erb :login
end

get '/index' do 

end 