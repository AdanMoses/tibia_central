get '/posts' do
  posts = get_posts()

  erb :'posts/index', locals: {posts: posts}
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  message = params[:message]
  create_message(message)

  redirect '/posts'
end