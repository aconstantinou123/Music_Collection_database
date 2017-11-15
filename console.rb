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

artist2 = Artist.new(
  {
  'name' => 'Adele'
})

artist1.save
artist2.save

album1 = Album.new(
  {
    'title' => 'Leave',
    'artist_id' => artist1.id
  }
)

album2 = Album.new(
  {
    'title' => 'Another daughter album...',
    'artist_id' => artist1.id
  }
)

album3 = Album.new(
  {
    'title' => '21',
    'artist_id' => artist2.id
  }
)

album1.save
album2.save
album3.save

pp artist1.list_albums
# pp Album.list_all


binding.pry
nil
