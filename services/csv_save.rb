require_relative './bill_vote_consultation.rb'
require_relative './legislator_vote_consultation.rb'

require 'csv'

class CSVSave
  def self.call(file_name, columns_title, objects)
    CSV.open("./answers/#{file_name}", 'w') do |csv|
      csv << columns_title

      objects.each do |obj|
        if obj.class == Legislator
          csv << LegislatorVoteConsultation.call(obj.id, obj.name)
        else
          csv << BillVoteConsultation.call(obj.id, obj.title, obj.sponsor_id)
        end
      end
    end
  end
end
