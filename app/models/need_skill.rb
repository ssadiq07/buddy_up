class NeedSkill < ApplicationRecord
  belongs_to :user

 belongs_to :skill
#  has_one :skill



  #has_one :skill, :through => :team

#validates :skill_category, :presence => {:message => "Skills category cannot be blank." }
#validates :skill_subcategory, :presence => {:message => "Skills subcategory cannot be blank." }
#validates :skill_description, :presence => {:message => "Skills description cannot be blank." }
end
