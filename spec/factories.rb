FactoryBot.define do
  factory :answer do
    person
    question
    body { "Best answer ever" }
  end

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

  factory :question do
    label { "Your name?" }
    survey
  end

  factory :role do
    name { "Engineer" }
    billable { true }
  end

  factory :survey do
    name { "Engagement survey" }
    company
    person
  end
end
