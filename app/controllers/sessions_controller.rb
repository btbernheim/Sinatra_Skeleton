get '/sessions/new' do
  if session[:user_id] != nil
    redirect "/users/#{session[:user_id]}"
  else
  erb :'/sessions/new'
  end
end

post '/sessions' do
  #Existing users
  @user = User.find_by(email: params[:email])
  if @user.nil?
    erb :'/sessions/new'
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'/sessions/new'
  end
end

delete '/sessions/:id' do
  logout
  redirect '/'
end
