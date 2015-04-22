class Admin < ActiveRecord::Base
	has_many :fixed_costs, dependent: :destroy 
  has_many :partners, dependent: :restrict_with_exception 
  has_many :ciaoappusers, through: :partners
  has_one :user, as: :roleable, dependent: :destroy
  accepts_nested_attributes_for :user, allow_destroy: true


  def currentFixedCosts
  	#find the first fixedCosts created this month otherwise create it.
  	return self.fixed_costs.find_or_create_by(created_at: (Time.now - 30.day)..Time.now);
  end
end
