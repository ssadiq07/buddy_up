require "rails_helper"

feature "PREFERENCES" do
  context "index" do
    it "has the user of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.user_id)
      end
    end
  end

  context "index" do
    it "has the integer of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.integer)
      end
    end
  end

  context "index" do
    it "has the my formality of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.My_Formality)
      end
    end
  end

  context "index" do
    it "has the my schedule of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.My_Schedule)
      end
    end
  end

  context "index" do
    it "has the my experience of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.My_Experience)
      end
    end
  end

  context "index" do
    it "has the their formality of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.Their_Formality)
      end
    end
  end

  context "index" do
    it "has the their schedule of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.Their_Schedule)
      end
    end
  end

  context "index" do
    it "has the wt schedule of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.Wt_Schedule)
      end
    end
  end

  context "index" do
    it "has the wt formality of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.Wt_Formality)
      end
    end
  end

  context "index" do
    it "has the wt experience of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_content(current_preference.Wt_Experience)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 5 do
      test_preferences = create_list(:preference, 5)

      visit "/preferences"

      test_preferences.each do |current_preference|
        expect(page).to have_css("a[href*='#{current_preference.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct user", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.user_id)
    end
  end

  context "details page" do
    it "has the correct integer", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.integer)
    end
  end

  context "details page" do
    it "has the correct my formality", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.My_Formality)
    end
  end

  context "details page" do
    it "has the correct my schedule", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.My_Schedule)
    end
  end

  context "details page" do
    it "has the correct my experience", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.My_Experience)
    end
  end

  context "details page" do
    it "has the correct their formality", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.Their_Formality)
    end
  end

  context "details page" do
    it "has the correct their schedule", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.Their_Schedule)
    end
  end

  context "details page" do
    it "has the correct wt schedule", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.Wt_Schedule)
    end
  end

  context "details page" do
    it "has the correct wt formality", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.Wt_Formality)
    end
  end

  context "details page" do
    it "has the correct wt experience", points: 3 do
      preference_to_show = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_show.id}']", text: "Show details").click

      expect(page).to have_content(preference_to_show.Wt_Experience)
    end
  end

  context "index" do
    it "has a link to the new preference page", points: 2 do
      visit "/preferences"

      expect(page).to have_css("a", text: "Add a new preference")
    end
  end

  context "new form" do
    it "saves the user when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_user_id = "A fake user I'm typing at #{Time.now}"
      fill_in "User", with: test_user_id

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.user_id).to eq(test_user_id)
    end
  end

  context "new form" do
    it "saves the integer when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_integer = "A fake integer I'm typing at #{Time.now}"
      fill_in "Integer", with: test_integer

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.integer).to eq(test_integer)
    end
  end

  context "new form" do
    it "saves the my formality when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_My_Formality = rand(1000)
      fill_in "My formality", with: test_My_Formality

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.My_Formality).to eq(test_My_Formality)
    end
  end

  context "new form" do
    it "saves the my schedule when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_My_Schedule = rand(1000)
      fill_in "My schedule", with: test_My_Schedule

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.My_Schedule).to eq(test_My_Schedule)
    end
  end

  context "new form" do
    it "saves the my experience when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_My_Experience = rand(1000)
      fill_in "My experience", with: test_My_Experience

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.My_Experience).to eq(test_My_Experience)
    end
  end

  context "new form" do
    it "saves the their formality when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_Their_Formality = rand(1000)
      fill_in "Their formality", with: test_Their_Formality

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.Their_Formality).to eq(test_Their_Formality)
    end
  end

  context "new form" do
    it "saves the their schedule when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_Their_Schedule = rand(1000)
      fill_in "Their schedule", with: test_Their_Schedule

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.Their_Schedule).to eq(test_Their_Schedule)
    end
  end

  context "new form" do
    it "saves the wt schedule when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_Wt_Schedule = rand(1000)
      fill_in "Wt schedule", with: test_Wt_Schedule

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.Wt_Schedule).to eq(test_Wt_Schedule)
    end
  end

  context "new form" do
    it "saves the wt formality when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_Wt_Formality = rand(1000)
      fill_in "Wt formality", with: test_Wt_Formality

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.Wt_Formality).to eq(test_Wt_Formality)
    end
  end

  context "new form" do
    it "saves the wt experience when submitted", points: 2, hint: h("label_for_input") do
      visit "/preferences"
      click_on "Add a new preference"

      test_Wt_Experience = rand(1000)
      fill_in "Wt experience", with: test_Wt_Experience

      click_on "Create preference"

      last_preference = Preference.order(created_at: :asc).last
      expect(last_preference.Wt_Experience).to eq(test_Wt_Experience)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 2, hint: h("redirect_vs_render") do
      visit "/preferences"
      click_on "Add a new preference"

      click_on "Create preference"

      expect(page).to have_current_path("/preferences")
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      visit "/preferences"

      expect(page).to_not have_content("Preference created successfully.")

      click_on "Add a new preference"
      click_on "Create preference"

      expect(page).to have_content("Preference created successfully.")
    end
  end

  context "details page" do
    it "has a 'Delete preference' link", points: 2 do
      preference_to_delete = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 5 do
      preference_to_delete = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_delete.id}']", text: "Show details").click
      click_on "Delete preference"

      expect(Preference.exists?(preference_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 3, hint: h("redirect_vs_render") do
      preference_to_delete = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_delete.id}']", text: "Show details").click
      click_on "Delete preference"

      expect(page).to have_current_path("/preferences")
    end
  end

  context "delete link" do
    it "redirects to the index with a notice", points: 3, hint: h("copy_must_match") do
      preference_to_delete = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_delete.id}']", text: "Show details").click

      expect(page).to_not have_content("Preference deleted successfully.")

      click_on "Delete preference"

      expect(page).to have_content("Preference deleted successfully.")
    end
  end

  context "details page" do
    it "has an 'Edit preference' link", points: 5 do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit preference")
    end
  end

  context "edit form" do
    it "has user pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.user_id}']")
    end
  end

  context "edit form" do
    it "has integer pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.integer}']")
    end
  end

  context "edit form" do
    it "has my formality pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.My_Formality}']")
    end
  end

  context "edit form" do
    it "has my schedule pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.My_Schedule}']")
    end
  end

  context "edit form" do
    it "has my experience pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.My_Experience}']")
    end
  end

  context "edit form" do
    it "has their formality pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.Their_Formality}']")
    end
  end

  context "edit form" do
    it "has their schedule pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.Their_Schedule}']")
    end
  end

  context "edit form" do
    it "has wt schedule pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.Wt_Schedule}']")
    end
  end

  context "edit form" do
    it "has wt formality pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.Wt_Formality}']")
    end
  end

  context "edit form" do
    it "has wt experience pre-populated", points: 3, hint: h("value_attribute") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      expect(page).to have_css("input[value='#{preference_to_edit.Wt_Experience}']")
    end
  end

  context "edit form" do
    it "updates user when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, user_id: "Boring old user")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_user_id = "Exciting new user at #{Time.now}"
      fill_in "User", with: test_user_id

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.user_id).to eq(test_user_id)
    end
  end

  context "edit form" do
    it "updates integer when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, integer: "Boring old integer")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_integer = "Exciting new integer at #{Time.now}"
      fill_in "Integer", with: test_integer

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.integer).to eq(test_integer)
    end
  end

  context "edit form" do
    it "updates my formality when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, My_Formality: "Boring old my formality")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_My_Formality = rand(1000)
      fill_in "My formality", with: test_My_Formality

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.My_Formality).to eq(test_My_Formality)
    end
  end

  context "edit form" do
    it "updates my schedule when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, My_Schedule: "Boring old my schedule")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_My_Schedule = rand(1000)
      fill_in "My schedule", with: test_My_Schedule

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.My_Schedule).to eq(test_My_Schedule)
    end
  end

  context "edit form" do
    it "updates my experience when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, My_Experience: "Boring old my experience")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_My_Experience = rand(1000)
      fill_in "My experience", with: test_My_Experience

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.My_Experience).to eq(test_My_Experience)
    end
  end

  context "edit form" do
    it "updates their formality when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, Their_Formality: "Boring old their formality")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_Their_Formality = rand(1000)
      fill_in "Their formality", with: test_Their_Formality

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.Their_Formality).to eq(test_Their_Formality)
    end
  end

  context "edit form" do
    it "updates their schedule when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, Their_Schedule: "Boring old their schedule")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_Their_Schedule = rand(1000)
      fill_in "Their schedule", with: test_Their_Schedule

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.Their_Schedule).to eq(test_Their_Schedule)
    end
  end

  context "edit form" do
    it "updates wt schedule when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, Wt_Schedule: "Boring old wt schedule")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_Wt_Schedule = rand(1000)
      fill_in "Wt schedule", with: test_Wt_Schedule

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.Wt_Schedule).to eq(test_Wt_Schedule)
    end
  end

  context "edit form" do
    it "updates wt formality when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, Wt_Formality: "Boring old wt formality")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_Wt_Formality = rand(1000)
      fill_in "Wt formality", with: test_Wt_Formality

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.Wt_Formality).to eq(test_Wt_Formality)
    end
  end

  context "edit form" do
    it "updates wt experience when submitted", points: 5, hint: h("label_for_input button_type") do
      preference_to_edit = create(:preference, Wt_Experience: "Boring old wt experience")

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      click_on "Edit preference"

      test_Wt_Experience = rand(1000)
      fill_in "Wt experience", with: test_Wt_Experience

      click_on "Update preference"

      preference_as_revised = Preference.find(preference_to_edit.id)

      expect(preference_as_revised.Wt_Experience).to eq(test_Wt_Experience)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click
      details_page_path = page.current_path

      click_on "Edit preference"
      click_on "Update preference"

      expect(page).to have_current_path(details_page_path, only_path: true)
    end
  end

  context "edit form" do
    it "redirects to the details page with a notice", points: 3, hint: h("copy_must_match") do
      preference_to_edit = create(:preference)

      visit "/preferences"
      find("a[href*='#{preference_to_edit.id}']", text: "Show details").click

      expect(page).to_not have_content("Preference updated successfully.")

      click_on "Edit preference"
      click_on "Update preference"

      expect(page).to have_content("Preference updated successfully.")
    end
  end
end
