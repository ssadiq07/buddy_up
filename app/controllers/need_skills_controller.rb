class NeedSkillsController < ApplicationController
  def index
    @need_skills = NeedSkill.all

    render("need_skills_templates/index.html.erb")
  end

  def show
    @need_skill = NeedSkill.find(params[:id_to_display])

    render("need_skills_templates/show.html.erb")
  end

  def new_form
    @need_skill = NeedSkill.new
    render("need_skills_templates/new_form.html.erb")
  end

  def create_row
    @need_skill = NeedSkill.new

    @need_skill.skill_category = params[:skill_category]
    @need_skill.skill_subcategory = params[:skill_subcategory]
    @need_skill.skill_description = params[:skill_description]

    save_status = @need_skill.save

    if save_status == true
      redirect_to("/need_skills", :notice => "Need skill created successfully.")
    else
      render("need_skills_templates/new_form.html.erb")
    end
  end

  def edit_form
    @need_skill = NeedSkill.find(params[:prefill_with_id])

    render("need_skills_templates/edit_form.html.erb")
  end

  def update_row
    @need_skill = NeedSkill.find(params[:id_to_modify])

    @need_skill.skill_category = params[:skill_category]
    @need_skill.skill_subcategory = params[:skill_subcategory]
    @need_skill.skill_description = params[:skill_description]

    save_status = @need_skill.save

    if save_status == true
      redirect_to("/need_skills/#{@need_skill.id}", :notice => "Need skill updated successfully.")
    else
      render("need_skills_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @need_skill = NeedSkill.find(params[:id_to_remove])

    @need_skill.destroy

    redirect_to("/need_skills", :notice => "Need skill deleted successfully.")
  end
end
