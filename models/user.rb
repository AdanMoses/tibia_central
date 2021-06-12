require 'bcrypt'

def create_user(character_name, email, password)
  password_digest = BCrypt::Password.create(password)

  sql_query = ("INSERT INTO users(character_name, email, password) VALUES($1, $2, $3);")
  params = [character_name, email, password_digest]
  run_sql(sql_query, params)

end
