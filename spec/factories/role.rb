FactoryBot.define do
  factory :role do
    trait :admin do
      name :admin
    end

    trait :entertainer do
      name :entertainer
    end

    trait :requester do
      name :requester
    end
  end
end
