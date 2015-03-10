class Admin < ActiveRecord::Base
  has_many :partners, dependent: :restrict_with_exception 
  has_many :ciaoappusers, through: :partners
  has_one :user, as: :roleable

end
