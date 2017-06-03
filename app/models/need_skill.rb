class NeedSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :skill_id, presence: { scope: :user_id, message: " cannot be blank." }
  validates :skill_id, uniqueness: { scope: :user_id, message: " already exists." }
end
