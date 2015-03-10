FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin_role do
      role 'admin'
      association :roleable, :factory => :admin 
    end

    trait :partner_role do
      role 'partner'
      association :roleable, :factory => :partner 
    end

  end
end
