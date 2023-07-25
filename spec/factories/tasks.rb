FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task#{n}" }
    description { "MyString" }
    due_date { "2023-07-24 23:22:38" }
    category { nil }
  end
end
