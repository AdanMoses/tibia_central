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
  results = character_information(3)

  response = HTTParty.get('https://api.tibiadata.com/v2/characters/xinfusion.json')

  erb :'/users/show', layout: :layout, locals: {results: results, response: response}
end