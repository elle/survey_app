FactoryBot.define do
  factory :company do
    name { "Culture Amp" }
  end

  factory :person do
    first_name { "John" }
    sequence(:email) { |n| "person-#{n}@example.com" }
  end

  factory :post do
    title { "Best heading ever" }
    person
  end

  factory :survey do
    name { "Engagement survey" }
    company
  end
end
