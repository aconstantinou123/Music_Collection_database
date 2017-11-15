require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect( {dbname: 'music_collection', host: 'localhost'} )
      db.prepare('quesry', sql)
      result = db.exec_prepared('quesry', values)
    ensure
      db.close if db != nil
  end
  return result
end
