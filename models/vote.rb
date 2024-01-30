class Vote
  attr_accessor :id, :bill_id

  def initialize(id, bill_id)
    @id = id
    @bill_id = bill_id
  end
end
