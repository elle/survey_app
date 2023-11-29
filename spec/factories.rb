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
end
