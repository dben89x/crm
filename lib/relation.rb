class Relation
  require_relative('../data/crm')
  require 'pp'

  def initialize
    @result = []
  end

  def employees_of_companies
    CRM[:companies].each do |comp|
      @result << {name: comp[:name], employees: []}
    end
    @result.each do |res|
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
    pp @result
  end

  def all_employments
    CRM[:people].each do |person|
      person[:employments].each do |emp|
        @result << {company_id: emp[:company_id],
                    company_name: CRM[:companies].find{|comp| comp[:id] == emp[:company_id]}[:name],
                    person_id: person[:id],
                    person_first_name: person[:first_name],
                    person_last_name: person[:last_name],
                    title: emp[:title]
        }
      end
    end
    pp @result
  end

  def people_without_employments
    CRM[:people].each do |person|
      if person[:employments].empty?
        @result << {id: person[:id], first_name: person[:first_name], last_name: person[:last_name]}
      end
    end
    pp @result
  end

end
