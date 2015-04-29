require 'faker'

FactoryGirl.define do
  factory :ciaoappuser do
  	state_id {Random.rand(3)}
  	country_code {Random.rand(4)}
  	gender {[0,1].sample}
    is_active {[0,1].sample}
    date_of_birth {Faker::Time.between(100.years.ago, Time.now, :all)}
    modified_at {Faker::Time.between(7.weeks.ago, Time.now, :all)}
    signed_up_at {Faker::Time.between(3.months.ago,2.months.ago, :all)}
  end
end