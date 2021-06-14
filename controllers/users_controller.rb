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

  erb :'/users/show', layout: :layout, locals: {results: results, response: response}
end