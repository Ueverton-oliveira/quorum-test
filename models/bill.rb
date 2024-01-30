require_relative './vote.rb'
require_relative './vote_result.rb'

class Bill
  attr_accessor :id, :title, :sponsor_id

  def initialize(id, title, sponsor_id)
    @id = id
    @title = title
    @sponsor_id = sponsor_id
  end
end
