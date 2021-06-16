def create_message(userid, message)
  run_sql("INSERT INTO posts(userid, message) VALUES($1, $2);", [userid, message])
end

def get_posts()
  run_sql("SELECT * FROM posts")
end