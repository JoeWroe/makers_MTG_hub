FactoryGirl.define do
  sequence(:event_name) { |i| "Kaladesh Draft#{i}" }

  factory :event do
    name { generate(:event_name) }
    description "A nice old draft"
    game_format "Draft"
    cost 12
    start_time 1.hour.ago
  end
end
