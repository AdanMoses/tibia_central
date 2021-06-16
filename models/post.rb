def create_message message
  run_sql("INSERT INTO posts(message) VALUES($1);", [message])
end

def get_posts()
  run_sql("SELECT * FROM posts")
end