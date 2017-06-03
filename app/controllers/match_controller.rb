class MatchController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def show_matches
    #Setup parameters
    @my_profile = current_user
    @my_have_skills = current_user.have_skills
    @my_need_skills = current_user.need_skills
    @my_preferences = current_user.preference

    #Find potential matches
    @potential_matches = grab_potential_matches_v2


    if @potential_matches.count > 0 then
      #Score potential matches
      @scored_matches = score_matches(@potential_matches)

      #Sort output by descending match rate
      @scored_matches = @scored_matches.sort_by { |hsh| -1*hsh["score"] }
    end


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
preferences.My_Formality as Match_My_Formality,
preferences.My_Schedule as Match_My_Schedule,
preferences.My_Experience as Match_My_Experience,
preferences.Their_Formality as Match_Their_Formality,
preferences.Their_Schedule as Match_Their_Schedule,
preferences.Their_Experience as Match_Their_Experience,
preferences.Wt_Schedule as Match_Wt_Schedule,
preferences.Wt_Formality as Match_Wt_Formality,
preferences.Wt_Experience as Match_Wt_Experience,

MyPref.My_Formality as ThisUser_My_Formality,
MyPref.My_Schedule as ThisUser_My_Schedule,
MyPref.My_Experience as ThisUser_My_Experience,
MyPref.Their_Formality as ThisUser_Their_Formality,
MyPref.Their_Schedule as ThisUser_Their_Schedule,
MyPref.Their_Experience as ThisUser_Their_Experience,
MyPref.Wt_Schedule as ThisUser_Wt_Schedule,
MyPref.Wt_Formality as ThisUser_Wt_Formality,
MyPref.Wt_Experience as ThisUser_Wt_Experience

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
  teach.user_id = preferences.user_id

LEFT JOIN
    preferences MyPref
  WHERE
    MyPref.user_id = " + "\"#{current_user.id}\""  )

    return @potential_matches
  end


  def score_matches(potential_matches)

    #Create arrays to represent This User's Preferences
    a_answer = Vector[potential_matches.first["ThisUser_My_Formality"],
                potential_matches.first["ThisUser_My_Schedule"],
                potential_matches.first["ThisUser_My_Experience"]]

    a_expectations = Vector[potential_matches.first["ThisUser_Their_Formality"],
                potential_matches.first["ThisUser_Their_Schedule"],
                potential_matches.first["ThisUser_Their_Experience"]]

    a_weights = Vector[potential_matches.first["ThisUser_Wt_Formality"],
                potential_matches.first["ThisUser_Wt_Schedule"],
                potential_matches.first["ThisUser_Wt_Experience"]]

    #Create empty array to store scores
    outScores = Array.new

    #Loop through matches and calculate score
    for i in 0..potential_matches.count-1
      #Create arrays to represent Matches Preferences
      b_answer = Vector[potential_matches[i]["Match_My_Formality"],
                  potential_matches[i]["Match_My_Schedule"],
                  potential_matches[i]["Match_My_Experience"]]

      b_expectations = Vector[potential_matches[i]["Match_Their_Formality"],
                  potential_matches[i]["Match_Their_Schedule"],
                  potential_matches[i]["Match_Their_Experience"]]

      b_weights = Vector[potential_matches[i]["Match_Wt_Formality"],
                  potential_matches[i]["Match_Wt_Schedule"],
                  potential_matches[i]["Match_Wt_Experience"]]


      #Calculate scores
        #Person A scores
        bool_vec = Matrix.row_vector(to_boolean_vec(a_expectations - b_answer))
        weight_vec = Matrix.column_vector(a_weights)
        n = (bool_vec*weight_vec).inject(:+).to_f
        d = weight_vec.inject(:+).to_f
        a_match = n / d

        #Person B scores
        bool_vec = Matrix.row_vector(to_boolean_vec(b_expectations - a_answer))
        weight_vec = Matrix.column_vector(b_weights)
        n = (bool_vec*weight_vec).inject(:+).to_f
        d = weight_vec.inject(:+).to_f
        b_match = n / d

        outScore = (a_match*b_match)**(1.to_f/a_answer.count)

        potential_matches[i]["score"] = outScore

    end

    return potential_matches
  end

  def to_boolean(var)
    #force "0" evaluation to be "true", all else to be "false"
    case var
    when 0
        return 1
      else
        return 0
    end

  end

  def to_boolean_vec(vector)
    outArr = Array.new
    for i in 0..vector.size-1
      outArr[i] = to_boolean (vector[i])
    end
    return outArr
  end

end
