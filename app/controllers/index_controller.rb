get '/' do
  @image_url = Giphy.random.image_url
  erb :'index'
end
