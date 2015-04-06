class Admin < ActiveRecord::Base
  has_many :partners, dependent: :restrict_with_exception 
  has_many :ciaoappusers, through: :partners
  has_one :user, as: :roleable, dependent: :destroy
  accepts_nested_attributes_for :user, allow_destroy: true

end
