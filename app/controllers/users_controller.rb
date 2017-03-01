get '/users' do
  @users = User.all
  @session = session[:user_id]
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  # Access profile or site
  @user = User.find(params[:id])
  if session[:user_id] != @user.id
    redirect "/users"
  end
  erb :'users/show'
end

#
get '/users/:id/edit' do 
  @user = User.find_by(id: params[:id])
  erb :'/users/edit'
end 
#

post '/users' do
  #Create users
  @user = User.new(params[:user])
  # @user.password = params[:user][:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect 'session/new'
  end
end


