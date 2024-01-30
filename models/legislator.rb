require_relative './vote_result.rb'

class Legislator
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end
