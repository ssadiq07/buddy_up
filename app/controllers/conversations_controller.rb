class ConversationsController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

 def show_conversations
   @my_profile = current_user
   @conversing_buddies_ids = current_user.conversations.pluck(:buddy_id).uniq
   @conversing_buddies = User.find(@conversing_buddies_ids)

   @my_messages = current_user.conversations

   render("conversations/index.html.erb")
 end


 def show_messages

   @my_messages = current_user.conversations.where(buddy_id: params[:buddy_id])
   @conversing_buddy = User.find(params[:buddy_id])

  render("conversations/show_messages.html.erb")
 end

 def delete_messages

   #Delete messages only on my end, they can still see the conversation on their end
   @my_messages = Conversation.where('user_id = ? AND buddy_id = ?', current_user.id, params[:buddy_id])
   @my_messages.destroy_all

   #Redirect to show conversations
   show_conversations
 end

 def reply_message
      #Save a reply to existing convo (for current user id)
      @this_convo = Conversation.new
      @this_convo.user_id = current_user.id
      @this_convo.buddy_id = params[:buddy_id]
      @this_convo.sender_id = current_user.id
      @this_convo.recipient_id = params[:buddy_id]
      @this_convo.message = params[:message]
      @this_convo.save

      #Save a reply to existing convo (for buddy id)
      @this_convo = Conversation.new
      @this_convo.user_id = params[:buddy_id]
      @this_convo.buddy_id = current_user.id
      @this_convo.sender_id = params[:buddy_id]
      @this_convo.recipient_id = current_user.id
      @this_convo.message = params[:message]
      @this_convo.save

      #Redirect to show messages
      show_messages
 end


 def new_message_form
   @create_convo_buddy = User.find(params[:buddy_id])
   render("conversations/create_messages.html.erb")

 end

 def new_message
   reply_message

 end

end
