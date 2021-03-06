Rails.application.routes.draw do

  # Below for all other routes:
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Landing page
  root to: 'landing#index'


  # Profile
  get("/profile/new", { :controller => "profile", :action => "new_profile"})
  get("/profile/show/:id_to_show", { :controller => "profile", :action => "show_profile" })

  get('/profile/update', { :controller => 'profile', :action => 'update_profile' })
  get('/create_have_skill', { :controller => 'profile', :action => 'create_row_have_skill' })
  get("/delete_have_skill/:id_to_remove", { :controller => "profile", :action => "destroy_row_have_skill" })

  get('/create_need_skill', { :controller => 'profile', :action => 'create_row_need_skill' })
  get("/delete_need_skill/:id_to_remove", { :controller => "profile", :action => "destroy_row_need_skill" })

  get('/update_preferences', { :controller => 'profile', :action => 'save_profile_preferences' })

  #------------------------------

  # Matches
  get("/matches/show", { :controller => "match", :action => "show_matches"})

  #------------------------------

  # Mailbox
  get("/mailbox", { :controller => "conversations", :action => "show_conversations"})
  get("/mailbox/show/:buddy_id", { :controller => "conversations", :action => "show_messages"})
  get("/mailbox/delete/:buddy_id", { :controller => "conversations", :action => "delete_messages"})

  get("/mailbox/reply/:buddy_id", { :controller => "conversations", :action => "reply_message"})
  get("/mailbox/message/:buddy_id", { :controller => "conversations", :action => "reply_message"})
  get("/mailbox/new_message/:buddy_id", { :controller => "conversations", :action => "new_message_form"})

end
