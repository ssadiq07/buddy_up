# Copy this file into your spec/support folder; create one if you don't have it.
# https://github.com/firstdraft/increasing_random/blob/master/increasing_random.rb

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :preference do
    sequence(:id, IncreasingRandom.new) { |n| n.value }
    sequence(:user_id, IncreasingRandom.new) { |n| "Some fake user #{n}" }
    sequence(:integer, IncreasingRandom.new) { |n| "Some fake integer #{n}" }
    sequence(:My_Formality, IncreasingRandom.new) { |n| n.value }
    sequence(:My_Schedule, IncreasingRandom.new) { |n| n.value }
    sequence(:My_Experience, IncreasingRandom.new) { |n| n.value }
    sequence(:Their_Formality, IncreasingRandom.new) { |n| n.value }
    sequence(:Their_Schedule, IncreasingRandom.new) { |n| n.value }
    sequence(:Wt_Schedule, IncreasingRandom.new) { |n| n.value }
    sequence(:Wt_Formality, IncreasingRandom.new) { |n| n.value }
    sequence(:Wt_Experience, IncreasingRandom.new) { |n| n.value }
  end
end
