get '/channels/:id' do
    @channel = Channel.find(params[:id])
    erb :channel
end 

get '/channels/:id/subscribe' do
    # @channel = Channel.find(params[:id])
    @user = User.find(session[:user_id])
    # user_id = session[:user_id]
    Subscription.create(user_id: @user.id, channel_id: params[:id] )
    erb :profile
end 