require('pry-byebug')
require('pp')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('db/sql_runner.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  {
  'name' => 'Daughter'
})

artist1.save

album1 = Album.new(
  {
    'title' => 'Leave',
    'artist_id' => artist1.id
  }
)

album1.save

pp Artist.list_all
pp Album.list_all


binding.pry
nil
