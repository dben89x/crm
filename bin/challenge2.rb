require_relative('../data/crm')
require 'pp'

result = []
CRM[:people].each do |person|
  person[:employments].each do |emp|
    result << {company_id: emp[:company_id],
              company_name: CRM[:companies].find{|comp| comp[:id] == emp[:company_id]}[:name],
              person_id: person[:id],
              person_first_name: person[:first_name],
              person_last_name: person[:last_name],
              title: emp[:title]
    }
  end
end
pp result
