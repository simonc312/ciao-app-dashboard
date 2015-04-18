class Ciaoappuser < ActiveRecord::Base
  belongs_to :partner, inverse_of: :ciaoappusers
  enum country_code: [:united_states, :china, :brazil, :mexico, :canada]
  enum is_active: [:inactive, :active]
  enum state_id: [:CA, :WA, :NY, :TX]
  enum gender: [:male, :female]
  enum online_channels: [:facebook_ads, :google_adwords, :opera_ad_network, :fyver_ads]
	enum offline_channels: [:grocery_store, :repair_shop, :electronics_store, :discount_store, :other]

end
