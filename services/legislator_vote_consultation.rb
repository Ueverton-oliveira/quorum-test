require_relative '../models/vote_result.rb'
require_relative './application_service.rb'

class LegislatorVoteConsultation < ApplicationService
  attr_accessor :legislator_id, :legislator_name

  def initialize(legislator_id, legislator_name)
    @legislator_id = legislator_id
    @legislator_name = legislator_name
  end

  def call
    [legislator_id, legislator_name, supported_bills, opposed_bills]
  end

  def supported_bills
    consultation_number_of_votes(1)
  end

  def opposed_bills
    consultation_number_of_votes(2)
  end

  def vote_results
    all_vote_results.map { |vote| vote if vote.legislator_id == legislator_id }.compact
  end

  def consultation_number_of_votes(legislator_position)
    vote_results.map { |vote| vote if vote.vote_type == legislator_position.to_s }.compact.count
  end

  def all_vote_results
    vote_results_csv_reader = CSV.read("./quorum_files/vote_results.csv")[1..]
    vote_results_csv_reader.map { |vote_result| VoteResult.new(vote_result[0], vote_result[1], vote_result[2], vote_result[3]) }
  end
end
