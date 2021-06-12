def run_sql(sql_query, params = [])

  conenction = PG.connect(ENV['DATABASE_URL'] || {dbname: 'tibia_app'})
  conenction.prepare("statement_name", sql_query)
  results = conenction.exec_prepared("statement_name", params)
  conenction.close

  return results

end