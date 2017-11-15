require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :artist_id

  def initialize(details)

    @id = details['id'].to_i if details['id']
    @title = details['title']
    @artist_id = details['artist_id'].to_i

  end

  def save

    sql = 'INSERT INTO albums (
        title,
        artist_id
        )
        VALUES (
          $1,
          $2
          )
          RETURNING *'
    values = [@title, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM albums'
    SqlRunner.run(sql)
  end

  def self.list_all
    sql = 'SELECT * FROM albums'
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end
end
