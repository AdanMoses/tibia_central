
get '/sign_up' do
  redirect "/users/new"
end

get "/users/new" do
  erb :'/users/new', layout: :layout
end

post "/users/new" do
  character_name = params[:character_name]
  email = params[:email]
  password = params[:password]

  create_user(character_name, email, password)
  
  redirect '/login'
end

get "/user" do 

  userid = session[:user_id]
  response =
  results =

  find_character_information(userid)

  erb :'/users/show', layout: :layout, locals: {results: results, response: response, userid: userid}
end

get "/user/:userid/edit" do |userid|

  results = find_user_by_id(userid)

  erb :'users/edit', layout: :layout, locals: { results: results}
  
end

put "/user/:userid" do |userid|
  
  character_name = params[:character_name]
  email = params[:email]

  sql_query = ("UPDATE users SET character_name = $1, email = $2 WHERE userid = $3;")
  params = [character_name, email, userid]
  run_sql(sql_query, params)

  redirect "/user"
end