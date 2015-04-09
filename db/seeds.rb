# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Partner.delete_all
puts 'deleted existing partners'
Ciaoappuser.delete_all
puts 'deleted existing Ciaoappusers'
100.times do |k|
	partner = FactoryGirl.create(:partner)
	Random.rand(20).times do |k|
		ciao = FactoryGirl.create(:ciaoappuser)
		ciao.partner = partner
		ciao.save!
	end
end
puts 'CREATED 100 randomized partners and ciaoappusers.'
