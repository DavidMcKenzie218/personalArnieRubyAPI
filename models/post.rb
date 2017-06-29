require 'pg'

require_relative '../db/sqlRunner.rb'

class Post

  def self.oneResponse(response, db, dbName, host)  #Insets one response to the database

    sql = "INSERT INTO #{db} (spoken_word, response, catagory) VALUES ('#{response[:spoken_word]}', '#{response[:response]}', '#{response[:catagory]}');"
    SqlRunner.run(sql, dbName, host)

  end

  def self.manyResponses(responses, db, dbName, host) #Allows for more than one response top be added
    responses.map{|response| Post.oneResponse(response, db, dbName, host)}
  end


  #IMPORTANT METHOD ONLY FOR USED FOR TESTING WITH A DB TO DROP AND RECREATE TABLE TO PREVENT DATA PILLING UP - to allow for this the test dbTable has been hardcoded to prevent accidental calling of this method
  def self.__forTestingOnly(dbName, host)
    sql = "DROP TABLE postTestData;"
    SqlRunner.run(sql, dbName, host)
    sql = "CREATE TABLE postTestData(
            id serial4 primary key,
            spoken_word varchar(255),
            response varchar(255),
            catagory varchar(255)
          );"
    SqlRunner.run(sql, dbName, host)
  end
end