FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event ##{n}" }
    creator { association(:user, :organizer) }
  end
end
