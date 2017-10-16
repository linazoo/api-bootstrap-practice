get '/' do
  redirect '/index'
end

get '/session-info' do
  session.inspect
end

get '/index' do 
  @channels = Channel.all 
  erb :index
end 