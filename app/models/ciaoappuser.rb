class CiaoappuserDynamicMethodFinder
  attr_accessor :attribute, :action
  def initialize(method_sym)
    if method_sym.to_s =~ /^titleize_(.*)$/
      @attribute = $1.to_sym
      @action = "titleize"
    elsif method_sym.to_s =~ /^upcase_(.*)$/
      @attribute = $1.to_sym
      @action = "upcase"
    end

  end
  
  def match?
    @attribute != nil
  end
end

class Ciaoappuser < ActiveRecord::Base
	include Filterable 
	scope :country_code, -> (country_code) { where country_code: country_code }
  scope :state_id, -> (state_id) { where state_id: state_id }
  scope :gender, -> (gender) { where gender: gender }
  scope :age, -> (age) { where date_of_birth:  (Time.now - age["upper_bound"].to_i.years)..(Time.now - age["lower_bound"].to_i.years) }

  belongs_to :partner, inverse_of: :ciaoappusers
  enum country_code: [:united_states, :china, :brazil, :mexico, :canada]
  enum is_active: [:inactive, :active]
  enum state_id: [:CA, :WA, :NY, :TX]
  enum gender: [:male, :female]
  enum online_channels: [:facebook_ads, :google_adwords, :opera_ad_network, :fyver_ads]
	enum offline_channels: [:grocery_store, :repair_shop, :electronics_store, :discount_store, :other]
	enum graph_types: [:total_revenue, :average_revenue, :total_costs, :net_income]
	enum graph_frequency: [:yearly,:monthly,:weekly,:daily]

	def self.method_missing(method_sym, *arguments, &block)
    match = CiaoappuserDynamicMethodFinder.new(method_sym)
    if match.match?
      Ciaoappuser.send(match.attribute).map {|key,value| [key.send(match.action),value]}
    else
      super
    end
  end

  def self.respond_to?(method_sym, include_private = false)
    if CiaoappuserDynamicMethodFinder.new(method_sym).match?
      true
    else
      super
    end
  end

end
