get '/images/top_five' do
  @top_five = Giphy.trending(limit: 5)

  erb :'images/top_five'
end
