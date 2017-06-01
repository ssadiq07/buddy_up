class HaveSkill < ApplicationRecord

  belongs_to :user
  belongs_to :skill
#validates :skill_category, :presence => {:message => "Skills category cannot be blank." }
#validates :skill_subcategory, :presence => {:message => "Skills subcategory cannot be blank." }
#validates :skill_description, :presence => {:message => "Skills description cannot be blank." }
#  validates :skill_category, :presence => true, :message=>" cannot be blank"
#  validates :skill_subcategory, :presence => true, :message => "Skills require a subcategory."
#  validates :skill_description, :presence => true, :message => "Skills require a description."
end
