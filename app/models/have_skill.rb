class HaveSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :skill_id, :presence => {:message => " cannot be blank."}
end
