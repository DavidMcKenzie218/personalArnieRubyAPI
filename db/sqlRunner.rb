class SqlRunner     #Class to run the database connection

  def self.run(sql)
    begin
      db = PG.connect({dbname: 'personalArnieTestDb', host: 'localhost'})
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end
  

end