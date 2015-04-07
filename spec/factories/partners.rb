require 'faker'

FactoryGirl.define do
  factory :partner do
  	employee_size Random.rand(2000)
  	revenue_size Random.rand(2000)
  	address Faker::Address.street_address
  	city Random.rand(3)
  	country Random.rand(3)
  	zipcode Faker::Address.zip_code
  end
end