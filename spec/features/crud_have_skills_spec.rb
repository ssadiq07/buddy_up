require "rails_helper"

feature "HAVE SKILLS" do
  context "index" do
    it "has the skill category of every row", points: 5 do
      test_have_skills = create_list(:have_skill, 5)

      visit "/have_skills"

      test_have_skills.each do |current_have_skill|
        expect(page).to have_content(current_have_skill.skill_category)
      end
    end
  end

  context "index" do
    it "has the skill subcategory of every row", points: 5 do
      test_have_skills = create_list(:have_skill, 5)

      visit "/have_skills"

      test_have_skills.each do |current_have_skill|
        expect(page).to have_content(current_have_skill.skill_subcategory)
      end
    end
  end

  context "index" do
    it "has the skill description of every row", points: 5 do
      test_have_skills = create_list(:have_skill, 5)

      visit "/have_skills"

      test_have_skills.each do |current_have_skill|
        expect(page).to have_content(current_have_skill.skill_description)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 5 do
      test_have_skills = create_list(:have_skill, 5)

      visit "/have_skills"

      test_have_skills.each do |current_have_skill|
        expect(page).to have_css("a[href*='#{current_have_skill.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct skill category", points: 3 do
      have_skill_to_show = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(have_skill_to_show.skill_category)
    end
  end

  context "details page" do
    it "has the correct skill subcategory", points: 3 do
      have_skill_to_show = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(have_skill_to_show.skill_subcategory)
    end
  end

  context "details page" do
    it "has the correct skill description", points: 3 do
      have_skill_to_show = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_show.id}']", text: "Show details").click

      expect(page).to have_content(have_skill_to_show.skill_description)
    end
  end

  context "index" do
    it "has a link to the new have skill page", points: 2 do
      visit "/have_skills"

      expect(page).to have_css("a", text: "Add a new have skill")
    end
  end

  context "new form" do
    it "saves the skill category when submitted", points: 2, hint: h("label_for_input") do
      visit "/have_skills"
      click_on "Add a new have skill"

      test_skill_category = "A fake skill category I'm typing at #{Time.now}"
      fill_in "Skill category", with: test_skill_category

      click_on "Create have skill"

      last_have_skill = HaveSkill.order(created_at: :asc).last
      expect(last_have_skill.skill_category).to eq(test_skill_category)
    end
  end

  context "new form" do
    it "saves the skill subcategory when submitted", points: 2, hint: h("label_for_input") do
      visit "/have_skills"
      click_on "Add a new have skill"

      test_skill_subcategory = "A fake skill subcategory I'm typing at #{Time.now}"
      fill_in "Skill subcategory", with: test_skill_subcategory

      click_on "Create have skill"

      last_have_skill = HaveSkill.order(created_at: :asc).last
      expect(last_have_skill.skill_subcategory).to eq(test_skill_subcategory)
    end
  end

  context "new form" do
    it "saves the skill description when submitted", points: 2, hint: h("label_for_input") do
      visit "/have_skills"
      click_on "Add a new have skill"

      test_skill_description = "A fake skill description I'm typing at #{Time.now}"
      fill_in "Skill description", with: test_skill_description

      click_on "Create have skill"

      last_have_skill = HaveSkill.order(created_at: :asc).last
      expect(last_have_skill.skill_description).to eq(test_skill_description)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 2, hint: h("redirect_vs_render") do
      visit "/have_skills"
      click_on "Add a new have skill"

      click_on "Create have skill"

      expect(page).to have_current_path("/have_skills")
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      visit "/have_skills"

      expect(page).to_not have_content("Have skill created successfully.")

      click_on "Add a new have skill"
      click_on "Create have skill"

      expect(page).to have_content("Have skill created successfully.")
    end
  end

  context "details page" do
    it "has a 'Delete have skill' link", points: 2 do
      have_skill_to_delete = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 5 do
      have_skill_to_delete = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_delete.id}']", text: "Show details").click
      click_on "Delete have skill"

      expect(HaveSkill.exists?(have_skill_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 3, hint: h("redirect_vs_render") do
      have_skill_to_delete = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_delete.id}']", text: "Show details").click
      click_on "Delete have skill"

      expect(page).to have_current_path("/have_skills")
    end
  end

  context "delete link" do
    it "redirects to the index with a notice", points: 3, hint: h("copy_must_match") do
      have_skill_to_delete = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_delete.id}']", text: "Show details").click

      expect(page).to_not have_content("Have skill deleted successfully.")

      click_on "Delete have skill"

      expect(page).to have_content("Have skill deleted successfully.")
    end
  end

  context "details page" do
    it "has an 'Edit have skill' link", points: 5 do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit have skill")
    end
  end

  context "edit form" do
    it "has skill category pre-populated", points: 3, hint: h("value_attribute") do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      expect(page).to have_css("input[value='#{have_skill_to_edit.skill_category}']")
    end
  end

  context "edit form" do
    it "has skill subcategory pre-populated", points: 3, hint: h("value_attribute") do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      expect(page).to have_css("input[value='#{have_skill_to_edit.skill_subcategory}']")
    end
  end

  context "edit form" do
    it "has skill description pre-populated", points: 3, hint: h("value_attribute") do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      expect(page).to have_css("input[value='#{have_skill_to_edit.skill_description}']")
    end
  end

  context "edit form" do
    it "updates skill category when submitted", points: 5, hint: h("label_for_input button_type") do
      have_skill_to_edit = create(:have_skill, skill_category: "Boring old skill category")

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      test_skill_category = "Exciting new skill category at #{Time.now}"
      fill_in "Skill category", with: test_skill_category

      click_on "Update have skill"

      have_skill_as_revised = HaveSkill.find(have_skill_to_edit.id)

      expect(have_skill_as_revised.skill_category).to eq(test_skill_category)
    end
  end

  context "edit form" do
    it "updates skill subcategory when submitted", points: 5, hint: h("label_for_input button_type") do
      have_skill_to_edit = create(:have_skill, skill_subcategory: "Boring old skill subcategory")

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      test_skill_subcategory = "Exciting new skill subcategory at #{Time.now}"
      fill_in "Skill subcategory", with: test_skill_subcategory

      click_on "Update have skill"

      have_skill_as_revised = HaveSkill.find(have_skill_to_edit.id)

      expect(have_skill_as_revised.skill_subcategory).to eq(test_skill_subcategory)
    end
  end

  context "edit form" do
    it "updates skill description when submitted", points: 5, hint: h("label_for_input button_type") do
      have_skill_to_edit = create(:have_skill, skill_description: "Boring old skill description")

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      click_on "Edit have skill"

      test_skill_description = "Exciting new skill description at #{Time.now}"
      fill_in "Skill description", with: test_skill_description

      click_on "Update have skill"

      have_skill_as_revised = HaveSkill.find(have_skill_to_edit.id)

      expect(have_skill_as_revised.skill_description).to eq(test_skill_description)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click
      details_page_path = page.current_path

      click_on "Edit have skill"
      click_on "Update have skill"

      expect(page).to have_current_path(details_page_path, only_path: true)
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      have_skill_to_edit = create(:have_skill)

      visit "/have_skills"
      find("a[href*='#{have_skill_to_edit.id}']", text: "Show details").click

      expect(page).to_not have_content("Have skill updated successfully.")

      click_on "Edit have skill"
      click_on "Update have skill"

      expect(page).to have_content("Have skill updated successfully.")
    end
  end
end
