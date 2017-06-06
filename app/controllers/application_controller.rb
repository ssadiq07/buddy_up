class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, :keys => [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:edit, :keys => [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:edit_form, :keys => [:first_name, :last_name])

    end

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

    if user_signed_in? and current_user.valid? and current_user.preference != nil and current_user.have_skills != nil  and current_user.need_skills != nil then
      session["user_return_to"] || "/profile/show/" + current_user.id.to_s
    else
      session["user_return_to"] || "/profile/new"
    end


  end



end
