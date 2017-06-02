class ProfileController < ActionController::Base
  protect_from_forgery with: :exception

  def new_profile
      @my_profile = current_user
      @my_have_skills = current_user.have_skills
      @my_need_skills = current_user.need_skills
      @my_preferences = current_user.preference


      render("profiles/new_profile.html.erb")
  end

  def show_profile
      @my_profile = current_user
      @my_have_skills = current_user.have_skills
      @my_need_skills = current_user.need_skills
      @my_preferences = current_user.preference


      render("profiles/show_profile.html.erb")
  end

  def update_profile
    @my_profile = current_user

    @my_profile.first_name = params[:first_name]
    @my_profile.last_name = params[:last_name]
    @my_profile.bio = params[:bio]
    @my_profile.linked_in = params[:linked_in]
    @my_profile.twitter = params[:twitter]

    save_status = @my_profile.save

    if save_status == true
      #redirect_to("landing", :notice => "Profile updated successfully.")
      #render("profiles/new_profile.html.erb")
      new_profile
    else
      #render("profiles/new_profile.html.erb")
      new_profile
    end


  end

  #Have Skills For New Profile
  def create_row_have_skill
    @have_skill = HaveSkill.new

    @have_skill.user_id = current_user.id
    @have_skill.skill_id = params[:full_skill_name]
    @have_skill.skill_category = Skill.find_by(id: params[:full_skill_name]).skill_category
    @have_skill.skill_subcategory = Skill.find_by(id: params[:full_skill_name]).skill_subcategory
    @have_skill.skill_description = Skill.find_by(id: params[:full_skill_name]).skill_description

    save_status = @have_skill.save

    if save_status == true
      #redirect_to("/have_skills", :notice => "Have skill created successfully.")
      #render("profiles/new_profile.html.erb")
      new_profile
    else
      #render("have_skills_templates/new_form.html.erb")
      new_profile
      #render("profiles/new_profile.html.erb")

    end
  end


  def destroy_row_have_skill
    @have_skill = HaveSkill.find(params[:id_to_remove])

    @have_skill.destroy

    new_profile
    #render("profiles/new_profile.html.erb")
    #redirect_to("/have_skills", :notice => "Have skill deleted successfully.")
  end


  #Need Skills For New Profile
  def create_row_need_skill
    @need_skill = NeedSkill.new

    @need_skill.user_id = current_user.id
    @need_skill.skill_id = params[:full_skill_name]
    @need_skill.skill_category = Skill.find_by(id: params[:full_skill_name]).skill_category
    @need_skill.skill_subcategory = Skill.find_by(id: params[:full_skill_name]).skill_subcategory
    @need_skill.skill_description = Skill.find_by(id: params[:full_skill_name]).skill_description

    save_status = @need_skill.save

    if save_status == true
      #redirect_to("/have_skills", :notice => "Have skill created successfully.")
      #render("profiles/new_profile.html.erb")
      new_profile
    else
      #render("have_skills_templates/new_form.html.erb")
      new_profile
      #render("profiles/new_profile.html.erb")

    end
  end


  def destroy_row_need_skill
    @need_skill = NeedSkill.find(params[:id_to_remove])

    @need_skill.destroy

    new_profile
    #render("profiles/new_profile.html.erb")
    #redirect_to("/have_skills", :notice => "Have skill deleted successfully.")
  end

  #Preferences For New Profile
  def create_row_preference
    @preference = Preference.new
    @preference.user_id = current_user.id
    @preference.My_Formality = params[:My_Formality]
    @preference.My_Schedule = params[:My_Schedule]
    @preference.My_Experience = params[:My_Experience]
    @preference.Their_Formality = params[:Their_Formality]
    @preference.Their_Schedule = params[:Their_Schedule]
    @preference.Their_Experience = params[:Their_Experience]
    @preference.Wt_Schedule = params[:Wt_Schedule]
    @preference.Wt_Formality = params[:Wt_Formality]
    @preference.Wt_Experience = params[:Wt_Experience]

    save_status = @preference.save

    if save_status == true
      new_profile
    else
      new_profile
    end
  end

  def update_row_preference
    @preference = Preference.find(params[current_user.id])
    #@preference.user_id = current_user.id
    @preference.My_Formality = params[:My_Formality]
    @preference.My_Schedule = params[:My_Schedule]
    @preference.My_Experience = params[:My_Experience]
    @preference.Their_Formality = params[:Their_Formality]
    @preference.Their_Schedule = params[:Their_Schedule]
    @preference.Their_Experience = params[:Their_Experience]
    @preference.Wt_Schedule = params[:Wt_Schedule]
    @preference.Wt_Formality = params[:Wt_Formality]
    @preference.Wt_Experience = params[:Wt_Experience]

    save_status = @preference.save

    if save_status == true
      new_profile
    else
      new_profile
    end
  end

  def save_profile_preferences
    if Preference.where(params[current_user.id]).present? then
      #save current settings
      update_row_preference
    else
      #create a new row
      create_row_preference


    end
  end

end
