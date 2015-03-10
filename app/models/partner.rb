class Partner < ActiveRecord::Base
  has_and_belongs_to_many :admins
  has_many :ciaoappusers, inverse_of: :partner
  has_one :user, as: :roleable

end
