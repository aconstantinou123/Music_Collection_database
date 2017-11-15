require('pry-byebug')
require('pp')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('db/sql_runner.rb')

artist1 = Artist.new(
  {
  'name' => 'Daughter'
})

artist1.save

binding.pry
nil
