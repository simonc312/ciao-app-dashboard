require 'open-uri'
require 'csv'

CSV::Converters[:blank_to_nil] = lambda do |field|
	field && field.empty? ? nil : field
end

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

  def self.admarvel_headers
  	["Date", "Advertiser/Ad Network Name", "Campaign Name",	"Site ID",	"Site Name",	"Publisher ID",	"Publisher Name",	"Requests",	"Impressions",	"Fill Rate",	"Clicks",	"CTR",	"eCPM",	"Revenue"]
  end

  def self.admarvel_site_report_call
		url = 'http://map.admarvel.com/reports?type=site&uname=ciaomgr_api&upassword=ciao123&date_start=2015-02-10&date_end=2015-02-20&sids=95958'
		open(url) do |file|
			output_csv = CSV.new(file.read,:headers => Admin.admarvel_headers,:header_converters => :symbol, :converters => [:all, :blank_to_nil])
			ap output_csv.to_a.map{|site_entry| 
				site_entry
			}
		end 
	end
end
