require "rails_helper"

feature "NEED SKILLS" do
  context "index" do
    it "has the skill category of every row", points: 5 do
      test_need_skills = create_list(:need_skill, 5)

      visit "/need_skills"

      test_need_skills.each do |current_need_skill|
        expect(page).to have_content(current_need_skill.skill_category)
      end
    end
  end

  context "index" do
    it "has the skill subcategory of every row", points: 5 do
      test_need_skills = create_list(:need_skill, 5)

      visit "/need_skills"

      test_need_skills.each do |current_need_skill|
        expect(page).to have_content(current_need_skill.skill_subcategory)
      end
    end
  end

  context "index" do
    it "has the skill description of every row", points: 5 do
      test_need_skills = create_list(:need_skill, 5)

      visit "/need_skills"

      test_need_skills.each do |current_need_skill|
        expect(page).to have_content(current_need_skill.skill_description)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 5 do
      test_need_skills = create_list(:need_skill, 5)

      visit "/need_skills"

      test_need_skills.each do |current_need_skill|
        expect(page).to have_css("a[href*='#{current_need_skill.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct skill category", points: 3 do
      need_skill_to_show = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(need_skill_to_show.skill_category)
    end
  end

  context "details page" do
    it "has the correct skill subcategory", points: 3 do
      need_skill_to_show = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(need_skill_to_show.skill_subcategory)
    end
  end

  context "details page" do
    it "has the correct skill description", points: 3 do
      need_skill_to_show = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(need_skill_to_show.skill_description)
    end
  end

  context "index" do
    it "has a link to the new need skill page", points: 2 do
      visit "/need_skills"

      expect(page).to have_css("a", text: "Add a new need skill")
    end
  end

  context "new form" do
    it "saves the skill category when submitted", points: 2, hint: h("label_for_input") do
      visit "/need_skills"
      click_on "Add a new need skill"

      test_skill_category = "A fake skill category I'm typing at #{Time.now}"
      fill_in "Skill category", with: test_skill_category

      click_on "Create need skill"

      last_need_skill = NeedSkill.order(created_at: :asc).last
      expect(last_need_skill.skill_category).to eq(test_skill_category)
    end
  end

  context "new form" do
    it "saves the skill subcategory when submitted", points: 2, hint: h("label_for_input") do
      visit "/need_skills"
      click_on "Add a new need skill"

      test_skill_subcategory = "A fake skill subcategory I'm typing at #{Time.now}"
      fill_in "Skill subcategory", with: test_skill_subcategory

      click_on "Create need skill"

      last_need_skill = NeedSkill.order(created_at: :asc).last
      expect(last_need_skill.skill_subcategory).to eq(test_skill_subcategory)
    end
  end

  context "new form" do
    it "saves the skill description when submitted", points: 2, hint: h("label_for_input") do
      visit "/need_skills"
      click_on "Add a new need skill"

      test_skill_description = "A fake skill description I'm typing at #{Time.now}"
      fill_in "Skill description", with: test_skill_description

      click_on "Create need skill"

      last_need_skill = NeedSkill.order(created_at: :asc).last
      expect(last_need_skill.skill_description).to eq(test_skill_description)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 2, hint: h("redirect_vs_render") do
      visit "/need_skills"
      click_on "Add a new need skill"

      click_on "Create need skill"

      expect(page).to have_current_path("/need_skills")
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      visit "/need_skills"

      expect(page).to_not have_content("Need skill created successfully.")

      click_on "Add a new need skill"
      click_on "Create need skill"

      expect(page).to have_content("Need skill created successfully.")
    end
  end

  context "details page" do
    it "has a 'Delete need skill' link", points: 2 do
      need_skill_to_delete = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 5 do
      need_skill_to_delete = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_delete.id}']", text: "Show details").click
      click_on "Delete need skill"

      expect(NeedSkill.exists?(need_skill_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 3, hint: h("redirect_vs_render") do
      need_skill_to_delete = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_delete.id}']", text: "Show details").click
      click_on "Delete need skill"

      expect(page).to have_current_path("/need_skills")
    end
  end

  context "delete link" do
    it "redirects to the index with a notice", points: 3, hint: h("copy_must_match") do
      need_skill_to_delete = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_delete.id}']", text: "Show details").click

      expect(page).to_not have_content("Need skill deleted successfully.")

      click_on "Delete need skill"

      expect(page).to have_content("Need skill deleted successfully.")
    end
  end

  context "details page" do
    it "has an 'Edit need skill' link", points: 5 do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit need skill")
    end
  end

  context "edit form" do
    it "has skill category pre-populated", points: 3, hint: h("value_attribute") do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      expect(page).to have_css("input[value='#{need_skill_to_edit.skill_category}']")
    end
  end

  context "edit form" do
    it "has skill subcategory pre-populated", points: 3, hint: h("value_attribute") do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      expect(page).to have_css("input[value='#{need_skill_to_edit.skill_subcategory}']")
    end
  end

  context "edit form" do
    it "has skill description pre-populated", points: 3, hint: h("value_attribute") do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      expect(page).to have_css("input[value='#{need_skill_to_edit.skill_description}']")
    end
  end

  context "edit form" do
    it "updates skill category when submitted", points: 5, hint: h("label_for_input button_type") do
      need_skill_to_edit = create(:need_skill, skill_category: "Boring old skill category")

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      test_skill_category = "Exciting new skill category at #{Time.now}"
      fill_in "Skill category", with: test_skill_category

      click_on "Update need skill"

      need_skill_as_revised = NeedSkill.find(need_skill_to_edit.id)

      expect(need_skill_as_revised.skill_category).to eq(test_skill_category)
    end
  end

  context "edit form" do
    it "updates skill subcategory when submitted", points: 5, hint: h("label_for_input button_type") do
      need_skill_to_edit = create(:need_skill, skill_subcategory: "Boring old skill subcategory")

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      test_skill_subcategory = "Exciting new skill subcategory at #{Time.now}"
      fill_in "Skill subcategory", with: test_skill_subcategory

      click_on "Update need skill"

      need_skill_as_revised = NeedSkill.find(need_skill_to_edit.id)

      expect(need_skill_as_revised.skill_subcategory).to eq(test_skill_subcategory)
    end
  end

  context "edit form" do
    it "updates skill description when submitted", points: 5, hint: h("label_for_input button_type") do
      need_skill_to_edit = create(:need_skill, skill_description: "Boring old skill description")

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit need skill"

      test_skill_description = "Exciting new skill description at #{Time.now}"
      fill_in "Skill description", with: test_skill_description

      click_on "Update need skill"

      need_skill_as_revised = NeedSkill.find(need_skill_to_edit.id)

      expect(need_skill_as_revised.skill_description).to eq(test_skill_description)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click
      details_page_path = page.current_path

      click_on "Edit need skill"
      click_on "Update need skill"

      expect(page).to have_current_path(details_page_path, only_path: true)
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      need_skill_to_edit = create(:need_skill)

      visit "/need_skills"
      find("a[href*='#{need_skill_to_edit.id}']", text: "Show details").click

      expect(page).to_not have_content("Need skill updated successfully.")

      click_on "Edit need skill"
      click_on "Update need skill"

      expect(page).to have_content("Need skill updated successfully.")
    end
  end
end
