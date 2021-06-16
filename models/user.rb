require 'bcrypt'

def create_user(character_name, email, password)
  password_digest = BCrypt::Password.create(password)

  sql_query = ("INSERT INTO users(character_name, email, password_digest) VALUES($1, $2, $3);")
  params = [character_name, email, password_digest]
  run_sql(sql_query, params)

end

def character_information(userID)

  user_id = userID
  sql_query = ("SELECT character_name FROM users WHERE userid=#{user_id};")
  run_sql(sql_query)

end

def find_user_by_email email
  
  sql_query = ("SELECT * FROM users WHERE email = $1;")
  params = [email]
  results = run_sql(sql_query, params)

  if results.to_a.length > 0
    return results[0]
  else
    return nil
  end

end

def find_user_by_id id

  sql_query = ("SELECT * FROM users WHERE userid = $1;")
  params = [id]
  results = run_sql(sql_query, params)

  if results.to_a.length > 0
    return results[0]
  else
    return nil
  end

end

def find_character_information(userid)

  results = character_information(userid)
  character_name = results[0]["character_name"]

  if character_name.include? " "
    name_split = character_name.split
    rejoin = name_split.join "%20"
    character_name = rejoin
  end

  result_url = "https://api.tibiadata.com/v2/characters/#{character_name}.json"

  response = HTTParty.get(result_url)

  return response
  return results

end

def find_character_name(userid)
  
  response =
  results =
  find_character_information(userid)

  character_name = response["characters"]["data"]["name"]

  return character_name

end

def find_character_vocation(userid)
  
  response =
  results =
  find_character_information(userid)

  character_vocation = response["characters"]["data"]["vocation"]

  return character_vocation

end

def find_character_level(userid)
  
  response =
  results =
  find_character_information(userid)

  character_level = response["characters"]["data"]["level"]

  return character_level

end

def find_character_world(userid)
  
  response =
  results =
  find_character_information(userid)

  character_world = response["characters"]["data"]["world"]

  return character_world

end

def find_character_residence(userid)
  
  response =
  results =
  find_character_information(userid)

  character_residence = response["characters"]["data"]["residence"]

  return character_residence

end