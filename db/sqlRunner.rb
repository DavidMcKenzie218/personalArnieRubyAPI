class SqlRunner     #Class to run the database connection

  def self.run(sql, dbName, dbHost)
    begin
      db = PG.connect({dbname: dbName, host: dbHost})
      result = db.exec(sql)
    ensure
      db.close()
    end
    return result
  end
  

end