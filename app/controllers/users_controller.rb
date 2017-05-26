get '/users' do
  erb :'users/index'
end

#new - form to create a new user
get '/users/new' do
  erb :'users/new'
end

#create new user - POST submit form filled with data
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:id] = @user.id
    redirect :"/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

#after a user signs in - go here to their profile page
#show - display specific user info
get '/users/:id' do
  @user = User.find(params[:id])
  if session[:id] == @user.id
    # @images = current_user.images
    erb :'users/show'
  else
    status 422
    @errors = ["You don't have access!"]
    erb :'login/new'
  end
end

post '/users/:id/images' do
  # "HEY"
  Image.create(params[:image])
  redirect "/users/#{current_user.id}"
end
