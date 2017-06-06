class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :have_skills
  has_many :need_skills
  has_one :preference
  has_many :conversations

  validates :first_name, presence: { message: " cannot be blank." }
  validates :last_name, presence: { message: " cannot be blank." }

  #validates_associated :have_skills, :need_skills, :preference
  #validates_presence_of :preference, :if => :associated_validation_required?
  #validates_presence_of :have_skills
  #validates_presence_of :need_skills


end
