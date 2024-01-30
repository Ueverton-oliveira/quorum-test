require_relative '../models/vote.rb'
require_relative '../models/vote_result.rb'
require_relative './application_service.rb'

class BillVoteConsultation < ApplicationService
  attr_accessor :bill_id, :bill_title, :sponsor_id

  def initialize(bill_id, bill_title, sponsor_id)
    @bill_id = bill_id
    @bill_title = bill_title
    @sponsor_id = sponsor_id
  end

  def call
    [bill_id, bill_title, supporter_count, opposer_count, primary_sponsor]
  end

  def supporter_count
    consultation_bill_vote_results.map { |vote_result| vote_result.vote_type == 1.to_s }.count
  end

  def opposer_count
    consultation_bill_vote_results.map { |vote_result| vote_result.vote_type == 2.to_s }.count
  end

  def primary_sponsor
    legislators_csv_reader = CSV.read("./quorum_files/legislators.csv")[1..]

    sponsor = legislators_csv_reader.map { |row| row[1] if row[0] == sponsor_id }.compact.first
    sponsor || 'Unknown'
  end

  def consultation_bill_vote_results
    vote_results_csv_reader = CSV.read("./quorum_files/vote_results.csv")[1..]
    vote_results_csv_reader.map { |row| VoteResult.new(row[0],
                                                       row[1],
                                                       row[2],
                                                       row[3]) if row[2] == consultation_vote.id }.compact
  end

  def consultation_vote
    votes_csv_reader = CSV.read("./quorum_files/votes.csv")[1..]
    votes_csv_reader.map { |row| Vote.new(row[0], row[1]) if row[1] == bill_id }.compact.first
  end
end
