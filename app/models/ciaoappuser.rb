class Ciaoappuser < ActiveRecord::Base
  belongs_to :partner, inverse_of: :ciaoappusers
  enum country_code: [:united_states, :china, :brazil, :mexico, :canada]
  enum is_active: [:inactive, :active]
  enum state_id: [:CA, :WA, :NY, :TX]
  enum gender: [:male, :female]

end
