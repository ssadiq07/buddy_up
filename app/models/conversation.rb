class Conversation < ActiveRecord::Base

  belongs_to :user

  validates :message, presence: { message: " cannot be blank." }
end
