require 'pg'

require_relative '../db/sqlRunner.rb'

class Get

  def self.all(db, dbName, dbHost)        #Gets all of the entries from the database

    sql = "SELECT * FROM #{db};"
    return Get.mapItems(sql, dbName, dbHost)

  end

  def self.mapItems(sql, dbName, dbHost)    #Maps the sql to Data Objects

    entries = SqlRunner.run(sql, dbName, dbHost)
    result = entries.map{|entry| entry};
    return result

  end

  def self.oneEntry(number, db, dbName, dbHost)    #Gets a an entry at a specific position

    allEntries = Get.all(db, dbName, dbHost)
    return allEntries.slice((number - 1))

  end

  def self.firstEntry(db, dbName, dbHost)         #Gets the first entry of all entries

    return Get.oneEntry(1, db, dbName, dbHost);

  end

  def self.lastEntry(db, dbName, dbHost)        #Gets the last entry from all of the entries

    totalEntries = Get.all(db, dbName, dbHost).length
    return Get.oneEntry(totalEntries, db, dbName, dbHost)

  end

  def self.oneCatagory(catagory, db, dbName, dbHost)    #Gets all of the entries from on specific 
                                                        # catagory
    sql = "SELECT * FROM #{db} WHERE catagory = '#{catagory}';"
    return Get.mapItems(sql, dbName, dbHost)

  end

  def self.oneOfACatagory(number, catagory, db, dbName, dbHost) #Gets a specific entry from a specific
                                                                #catagory
    allOfCatagory = Get.oneCatagory(catagory, db, dbName, dbHost)
    return allOfCatagory.slice((number - 1))

  end

  def self.firstOfCatagory(catagory, db, dbName, dbHost)

    return Get.oneOfACatagory(1, catagory, db, dbName, dbHost)

  end

  def self.lastOfCatagory(catagory, db, dbName, dbHost)

    totalEntries = Get.oneCatagory(catagory, db, dbName, dbHost).length
    return Get.oneOfACatagory(totalEntries, catagory, db, dbName, dbHost)

  end

end