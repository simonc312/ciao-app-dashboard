FactoryGirl.define do
  factory :partner do
  	employee_size 500
  	revenue_size "5 million"
  	address "2011 Lincoln Ave"
  	city "Berkeley"
  	country "USA"
  	zipcode 94709
  	#user_attributes [:id,:name,:email,:password,:role,:roleable]
  end
end