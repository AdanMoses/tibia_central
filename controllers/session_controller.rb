get '/login' do
  erb :'/sessions/login', layout: :layout, locals: {error_message: ''}
end

post '/sessions' do
  email = params['email']
  password = params['password']

  users = run_sql("SELECT * FROM users WHERE email='#{email}'")
  user = user_found(users)

  if user && BCrypt::Password.new(user['password_digest']) == params['password']
    session[:user_id] = user['userid']

    redirect '/user'
  else
    erb :'/sessions/login', layout: :layout, locals: {error_message: 'Incorrect Password'}
  end

end

delete '/sessions' do
  session[:user_id] = nil

  redirect '/'
end
