class PreferencesController < ApplicationController
  def index
    @preferences = Preference.all

    render("preferences_templates/index.html.erb")
  end

  def show
    @preference = Preference.find(params[:id_to_display])

    render("preferences_templates/show.html.erb")
  end

  def new_form
    @preference = Preference.new
    render("preferences_templates/new_form.html.erb")
  end

  def create_row
    @preference = Preference.new

    @preference.user_id = params[:user_id]
    @preference.integer = params[:integer]
    @preference.My_Formality = params[:My_Formality]
    @preference.My_Schedule = params[:My_Schedule]
    @preference.My_Experience = params[:My_Experience]
    @preference.Their_Formality = params[:Their_Formality]
    @preference.Their_Schedule = params[:Their_Schedule]
    @preference.Wt_Schedule = params[:Wt_Schedule]
    @preference.Wt_Formality = params[:Wt_Formality]
    @preference.Wt_Experience = params[:Wt_Experience]

    save_status = @preference.save

    if save_status == true
      redirect_to("/preferences", :notice => "Preference created successfully.")
    else
      render("preferences_templates/new_form.html.erb")
    end
  end

  def edit_form
    @preference = Preference.find(params[:prefill_with_id])

    render("preferences_templates/edit_form.html.erb")
  end

  def update_row
    @preference = Preference.find(params[:id_to_modify])

    @preference.user_id = params[:user_id]
    @preference.integer = params[:integer]
    @preference.My_Formality = params[:My_Formality]
    @preference.My_Schedule = params[:My_Schedule]
    @preference.My_Experience = params[:My_Experience]
    @preference.Their_Formality = params[:Their_Formality]
    @preference.Their_Schedule = params[:Their_Schedule]
    @preference.Wt_Schedule = params[:Wt_Schedule]
    @preference.Wt_Formality = params[:Wt_Formality]
    @preference.Wt_Experience = params[:Wt_Experience]

    save_status = @preference.save

    if save_status == true
      redirect_to("/preferences/#{@preference.id}", :notice => "Preference updated successfully.")
    else
      render("preferences_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @preference = Preference.find(params[:id_to_remove])

    @preference.destroy

    redirect_to("/preferences", :notice => "Preference deleted successfully.")
  end
end
