class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_up_path_for(resource)
    @my_profile = current_user
    @my_have_skills = current_user.have_skills
    @my_need_skills = current_user.need_skills
    @my_preferences = current_user.preference
    session["user_return_to"] || "/profile/new"

  end

  def after_sign_in_path_for(resource)
    @my_profile = current_user
    @my_have_skills = current_user.have_skills
    @my_need_skills = current_user.need_skills
    @my_preferences = current_user.preference
    session["user_return_to"] || "/profile/new"

  end

end
