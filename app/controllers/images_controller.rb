get '/images/top_five' do
  @top_five = Giphy.trending(limit: 5)
  erb :'images/top_five'
end

#route to delete an image of user page
get '/users/:user_id/image/:id/delete' do
  @image = Image.find(params[:id])
  @image.destroy
  @user = User.find(params[:user_id])
  # @messages = ["Your Image was deleted!"]
  # redirect "/users/#{current_user.id}"
  erb :'users/show'
end
