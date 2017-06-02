class Skill < ApplicationRecord
has_one :need_skills
has_one :have_skills

  #Custom skill name for selecting in form
  def full_skill_name
    "#{skill_category} > #{skill_subcategory} > #{skill_description}"
  end

end
