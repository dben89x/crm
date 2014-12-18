require_relative('../data/crm')
require 'pp'

result = []
CRM[:companies].each do |comp|
  result << {name: comp[:name], employees: []}
end
result.each do |res|
  CRM[:people].each do |person|
    person[:employments].each do |emp|
      if emp[:company_id] == CRM[:companies].find{|comp| comp[:name] == res[:name]}[:id]
        res[:employees] << {id: person[:id],
                            first_name: person[:first_name],
                            last_name: person[:last_name],
                            title: emp[:title]}
      end
    end
  end
end
pp result
