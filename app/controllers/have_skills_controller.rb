class HaveSkillsController < ApplicationController
  def index
    @have_skills = HaveSkill.all

    render("have_skills_templates/index.html.erb")
  end

  def show
    @have_skill = HaveSkill.find(params[:id_to_display])

    render("have_skills_templates/show.html.erb")
  end

  def new_form
    @have_skill = HaveSkill.new
    render("have_skills_templates/new_form.html.erb")
  end

  def create_row
    @have_skill = HaveSkill.new

    @have_skill.user_id = current_user.id
    @have_skill.skill_category = params[:skill_category]
    @have_skill.skill_subcategory = params[:skill_subcategory]
    @have_skill.skill_description = params[:skill_description]

    save_status = @have_skill.save

    new_profile
    
    if save_status == true
      #redirect_to("/have_skills", :notice => "Have skill created successfully.")
      render("profiles/new_profile.html.erb")
    else
      #render("have_skills_templates/new_form.html.erb")
      render("profiles/new_profile.html.erb")

    end
  end

  def edit_form
    @have_skill = HaveSkill.find(params[:prefill_with_id])

    render("have_skills_templates/edit_form.html.erb")
  end

  def update_row

    @have_skill = HaveSkill.find(params[:id_to_modify])

    @have_skill.skill_category = params[:skill_category]
    @have_skill.skill_subcategory = params[:skill_subcategory]
    @have_skill.skill_description = params[:skill_description]

    save_status = @have_skill.save

    if save_status == true
      redirect_to("/have_skills/#{@have_skill.id}", :notice => "Have skill updated successfully.")
    else
      render("have_skills_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @have_skill = HaveSkill.find(params[:id_to_remove])

    @have_skill.destroy

    render("profiles/new_profile.html.erb")
    #redirect_to("/have_skills", :notice => "Have skill deleted successfully.")
  end
end
