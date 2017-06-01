# Copy this file into your spec/support folder; create one if you don't have it.
# https://github.com/firstdraft/increasing_random/blob/master/increasing_random.rb

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :have_skill do
    sequence(:id, IncreasingRandom.new) { |n| n.value }
    sequence(:skill_category, IncreasingRandom.new) { |n| "Some fake skill category #{n}" }
    sequence(:skill_subcategory, IncreasingRandom.new) { |n| "Some fake skill subcategory #{n}" }
    sequence(:skill_description, IncreasingRandom.new) { |n| "Some fake skill description #{n}" }
  end
end
