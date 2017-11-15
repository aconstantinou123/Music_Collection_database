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

end
