get '/channels/:id' do
    @channel = Channel.find(params[:id])
    erb :channel
end 