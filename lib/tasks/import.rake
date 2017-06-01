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

end
