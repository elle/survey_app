FactoryBot.define do
  factory :company do
    name { "Culture Amp" }
  end

  factory :person do
    first_name { "John" }
    sequence(:email) { |n| "person-#{n}@example.com" }
    role
  end

  factory :post do
    title { "Best heading ever" }
    person
  end

  factory :role do
    name { "Engineer" }
    billable { true }
  end

  factory :survey do
    name { "Engagement survey" }
    company
  end
end
