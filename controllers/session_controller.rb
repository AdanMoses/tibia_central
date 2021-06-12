get '/login' do
  erb :'/sessions/login', layout: :layout
end

post '/sessions' do
  email = params[:email]
  password = params[:user_password]

  user = find_user_by_email(email)

  if user && BCrypt::Password.new(user['password_digest']) == password
    session[:user_id] = user['userid']
    redirect '/user'
  else
    erb :'/sessions/login', layout: :layout, locals: {error_message: 'Incorrect Password'}
  end

end