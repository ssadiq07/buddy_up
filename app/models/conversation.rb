class Conversation < ActiveRecord::Base

#http://josephndungu.com/tutorials/gmail-like-chat-application-in-ruby-on-rails
  belongs_to :user

# belongs_to :user, :foreign_key => :buddy_id, class_name: 'User'
 has_many :users, :primary_key => :buddy_id

end
