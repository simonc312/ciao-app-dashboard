class FixedCost < ActiveRecord::Base
	belongs_to :admin 
	enum costs: [:rent,:misc,:server_hosting,:salaries] 
	def sumCosts
		return FixedCost.costs.keys.map{|cost| self.send(cost) }.compact.sum
	end
end