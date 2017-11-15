class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @name = details['name']
    @id = details['id'].to_i if details['id']
  end





end
