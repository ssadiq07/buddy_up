class Preference < ApplicationRecord
  validates :My_Formality, presence: { scope: :user_id, message: " cannot be blank." }
  validates :My_Schedule, presence: { scope: :user_id, message: " cannot be blank." }
  validates :My_Experience, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Their_Formality, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Their_Schedule, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Their_Experience, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Wt_Schedule, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Wt_Formality, presence: { scope: :user_id, message: " cannot be blank." }
  validates :Wt_Experience, presence: { scope: :user_id, message: " cannot be blank." }

end
