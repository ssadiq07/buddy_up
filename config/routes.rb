Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Landing page
  root to: 'landing#index'

  # Profile
  get("/profile/new", { :controller => "profile", :action => "new_profile"})
  get("/profile/show", { :controller => "profile", :action => "show_profile"})

  get('/profile/update', { :controller => 'profile', :action => 'update_profile' })
  get('/create_have_skill', { :controller => 'profile', :action => 'create_row_have_skill' })
  get("/delete_have_skill/:id_to_remove", { :controller => "profile", :action => "destroy_row_have_skill" })

  get('/create_need_skill', { :controller => 'profile', :action => 'create_row_need_skill' })
  get("/delete_need_skill/:id_to_remove", { :controller => "profile", :action => "destroy_row_need_skill" })

  get('/update_preferences', { :controller => 'profile', :action => 'save_profile_preferences' })


  # Matches
  get("/matches/show", { :controller => "match", :action => "show_matches"})

  #------------------------------

  # Routes for the Have skill resource:

  # CREATE
  get("/have_skills/new", { :controller => "have_skills", :action => "new_form" })
  post("/create_have_skill", { :controller => "have_skills", :action => "create_row" })

  # READ
  get("/have_skills", { :controller => "have_skills", :action => "index" })
  get("/have_skills/:id_to_display", { :controller => "have_skills", :action => "show" })

  # UPDATE
  get("/have_skills/:prefill_with_id/edit", { :controller => "have_skills", :action => "edit_form" })
  post("/update_have_skill/:id_to_modify", { :controller => "have_skills", :action => "update_row" })

  # DELETE
  #get("/delete_have_skill/:id_to_remove", { :controller => "have_skills", :action => "destroy_row" })

  #------------------------------
  # Routes for the Need skill resource:

  # CREATE
  get("/need_skills/new", { :controller => "need_skills", :action => "new_form" })
  post("/create_need_skill", { :controller => "need_skills", :action => "create_row" })

  # READ
  get("/need_skills", { :controller => "need_skills", :action => "index" })
  get("/need_skills/:id_to_display", { :controller => "need_skills", :action => "show" })

  # UPDATE
  get("/need_skills/:prefill_with_id/edit", { :controller => "need_skills", :action => "edit_form" })
  post("/update_need_skill/:id_to_modify", { :controller => "need_skills", :action => "update_row" })

  # DELETE
  get("/delete_need_skill/:id_to_remove", { :controller => "need_skills", :action => "destroy_row" })

  #------------------------------

  # Routes for the Preference resource:

  # CREATE
  get("/preferences/new", { :controller => "preferences", :action => "new_form" })
  post("/create_preference", { :controller => "preferences", :action => "create_row" })

  # READ
  get("/preferences", { :controller => "preferences", :action => "index" })
  get("/preferences/:id_to_display", { :controller => "preferences", :action => "show" })

  # UPDATE
  get("/preferences/:prefill_with_id/edit", { :controller => "preferences", :action => "edit_form" })
  post("/update_preference/:id_to_modify", { :controller => "preferences", :action => "update_row" })

  # DELETE
  get("/delete_preference/:id_to_remove", { :controller => "preferences", :action => "destroy_row" })

  #------------------------------


end
