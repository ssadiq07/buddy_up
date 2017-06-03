class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :have_skills
  has_many :need_skills
  has_one :preference

#validates_associated :have_skills

  validates :first_name, presence: { message: " cannot be blank." }
  validates :last_name, presence: { message: " cannot be blank." }
end
