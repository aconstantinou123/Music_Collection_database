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


end
