# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidates.find { |candidate| candidate[:id] == id } 
end

def knows_languages?(candidate, languages)
  !(candidate[:languages] & languages).empty?
end

def experienced?(candidate)
	candidate.[:years_of_experience] >= 2
end

def days_ago_applied(candidate)
  (candidate[:date_applied] - 0.days.ago.to_date).to_i * -1
end

def qualified_candidates(candidates)
  candidates.find { |candidate| experienced?(candidate) && candidate[:github_points] >= 100 && knows_languages?(candidate, ['JavaScript, Ruby']) && days_ago_applied(candidate) <= 15 && candidate[:age] >= 18 }
end

def ordered_by_qualifications(candidates)
  candidates.sort { |first, second| 
    if first[:years_of_experience] == second[:years_of_experience] then
      second[:github_points] <=> first[:github_points]
    else
      second[:years_of_experience] <=> first[:years_of_experience]
    end
   } 
end
