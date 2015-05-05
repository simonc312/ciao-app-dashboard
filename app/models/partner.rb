class Partner < ActiveRecord::Base
	include Filterable
	#scope :frequency, -> (frequency) { "group_by_"+frequency }
  has_and_belongs_to_many :admins
  has_many :ciaoappusers, inverse_of: :partner
  has_one :user, as: :roleable, dependent: :destroy
  accepts_nested_attributes_for :user, allow_destroy: true 
  enum country: [:united_states, :china, :brazil, :mexico, :canada]

end
