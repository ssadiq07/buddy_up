class Skill < ApplicationRecord
has_one :need_skills
has_one :have_skills
#belongs_to :need_skills

  def full_skill_name
   "#{skill_category} > #{skill_subcategory} > #{skill_description}"
end

end
