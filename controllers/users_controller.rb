
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
  
  redirect '/'
end

get "/user" do 

  userid = session[:user_id]

  results = character_information(userid)
  character_name = results[0]["character_name"]

  if character_name.include? " "
    name_split = character_name.split
    rejoin = name_split.join "%20"
    character_name = rejoin
  end

  result_url = "https://api.tibiadata.com/v2/characters/#{character_name}.json"

  response = HTTParty.get(result_url)

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