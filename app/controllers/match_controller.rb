class MatchController < ActionController::Base
  protect_from_forgery with: :exception
  def show_matches
    #Setup parameters
    @my_profile = current_user
    @my_have_skills = current_user.have_skills
    @my_need_skills = current_user.need_skills
    @my_preferences = current_user.preference

    #Find potential matches
    @potential_matches = grab_potential_matches_v2


    render("matches/show_matches.html.erb")
  end

  def grab_potential_matches
    #Create array of skills ids
    my_needs = Array.new
    for i in 0..current_user.need_skills.count-1
        my_needs[i] = current_user.need_skills[i].skill_id
    end
    my_haves = Array.new
    for i in 0..current_user.have_skills.count-1
        my_haves[i] = current_user.have_skills[i].skill_id
    end

    #Find potential matches
    @potential_matches_fitmyneeds = HaveSkill.where(skill_id: my_needs)
    @potential_matches_ifitthem = NeedSkill.where(skill_id: my_haves)
    ifitthem = Array.new
    for i in 0..@potential_matches_ifitthem.count-1
        ifitthem[i] = @potential_matches_ifitthem[i].user_id
    end

    @potential_matches = @potential_matches_fitmyneeds.where(user_id: ifitthem)
    return @potential_matches
  end

  def grab_potential_matches_v2
    @potential_matches = ActiveRecord::Base.connection.execute("SELECT
users.*,
learn.skill_category as learn_skill_category, learn.skill_subcategory as learn_skill_subcategory, learn.skill_description as learn_skill_description,
teach.skill_category as teach_skill_category, teach.skill_subcategory as teach_skill_subcategory, teach.skill_description as teach_skill_description,
preferences.*
FROM
(SELECT
    need_skills.*
 FROM
    have_skills
 INNER JOIN
    need_skills
 WHERE
  need_skills.skill_id = have_skills.skill_id AND
  have_skills.user_id = " + "\"#{current_user.id}\""  + " ) teach

INNER JOIN

(SELECT
    have_skills.*
 FROM
    need_skills
 INNER JOIN
    have_skills
 WHERE
  have_skills.skill_id = need_skills.skill_id AND
  need_skills.user_id = " + "\"#{current_user.id}\""  + " ) learn

ON
  teach.user_id = learn.user_id

INNER JOIN
  users
ON
  teach.user_id != " + "\"#{current_user.id}\""  + " AND
  teach.user_id = users.id

INNER JOIN
  preferences
ON
  teach.user_id = preferences.id
       "
)



    return @potential_matches
  end



end
