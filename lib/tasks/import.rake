require 'csv'
namespace :import do
  desc "Import skills list from CSV"
  task Skills_List: :environment do
    Skill.delete_all
    csv_text = File.read('seed/Skills_List.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Skill.create!(row.to_hash)
    end
  end

  desc "Import Users from CSV"
  task Users: :environment do
    User.delete_all
    csv_text = File.read('seed/Users.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      User.create!(row.to_hash)
    end
  end

  desc "Import Preferences from CSV"
  task Pref: :environment do
    Preference.delete_all
    csv_text = File.read('seed/Preferences.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Preference.create!(row.to_hash)
    end
  end

  desc "Import have skills from CSV"
  task Have_Skills: :environment do
    HaveSkill.delete_all
    csv_text = File.read('seed/Have_Skills.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      HaveSkill.create!(row.to_hash)
    end
  end

  desc "Import need skills from CSV"
  task Need_Skills: :environment do
    NeedSkill.delete_all
    csv_text = File.read('seed/Need_Skills.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      NeedSkill.create!(row.to_hash)
    end
  end

end
