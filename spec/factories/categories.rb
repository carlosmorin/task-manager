FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
    description { "MyText" }
  end

  trait :with_tasks do
    after :create do |category|
      create_list :task, 3, category: category
    end
  end
end
