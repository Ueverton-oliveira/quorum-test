require_relative './models/legislator.rb'
require_relative './models/bill.rb'
require_relative './services/csv_save.rb'

class Result
  LEGISLATOR_SUPPORT_AND_OPPOSE_CSV_COLUMNS = %w[id name supported_bills opposed_bills]
  BILL_CSV_COLUMNS = %w[id title supporter_count opposer_count primary_sponsor]


  def legislators_votes
    legislators_csv_reader = CSV.read("./quorum_files/legislators.csv")[1..]
    legislators = legislators_csv_reader.map { |row| Legislator.new(row[0], row[1]) }
    CSVSave.call('legislators-support-and-oppose.csv', LEGISLATOR_SUPPORT_AND_OPPOSE_CSV_COLUMNS, legislators)
  end

  def bill_votes
    bills_csv_reader = CSV.read("./quorum_files/bills.csv")[1..]
    bills = bills_csv_reader.map { |row| Bill.new(row[0], row[1], row[2]) }
    CSVSave.call('bills.csv', BILL_CSV_COLUMNS, bills)
  end
end

Result.new.legislators_votes
Result.new.bill_votes
