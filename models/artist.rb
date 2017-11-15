require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @name = details['name']
    @id = details['id'].to_i if details['id']
  end

  def save
    sql = 'INSERT INTO artists (
        name
      )
      VALUES
      (
        $1
      )
      RETURNING *'
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM artists'
    SqlRunner.run(sql)
  end

  def self.list_all
    sql = 'SELECT * FROM artists'
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

end
