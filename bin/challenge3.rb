require_relative('../data/crm')
require 'pp'

result = []
CRM[:people].each do |person|
  if person[:employments].empty?
    result << {id: person[:id], first_name: person[:first_name], last_name: person[:last_name]}
  end
end
pp result
