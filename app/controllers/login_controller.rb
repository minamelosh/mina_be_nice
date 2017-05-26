#login form
get '/login' do
  erb :'login/new'
end

#create new session
post '/login' do
  @user = User.find_by(user_name: params[:user][:user_name])
  if @user && @user.authenticate?(params[:user][:hashed_password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
   @errors = ["incorrect User name or password"]
   erb :'login/new'
  end
end

#logout
get '/logout' do
  logout
  redirect '/'
end
