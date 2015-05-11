require 'open-uri'
require 'csv'
require 'uri'
CSV::Converters[:blank_to_nil] = lambda do |field|
	field && field.empty? ? nil : field
end

CSV::Converters[:currency_to_int] = lambda do |field|
	field && field =~ /^\$ (.*)$/ ? $1.to_f : field
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

  def admarvel_site_report_call(query)
		output_csv = {}
		url = Admarvel.new(query).site_report_url
		ap url
		body = open(url).read 
		output_csv = CSV.new(body,:headers => Admarvel.site_headers,:header_converters => :symbol, :converters => [:all, :blank_to_nil, :currency_to_int])
		output_csv = output_csv.to_a[2...-1]
		output_csv = output_csv.map {|data|
			AdmarvelReport.new(data)
		}
		output_csv =  output_csv.group_by {|report| report.campaign_name }
		ap output_csv
		return output_csv.each{|key,value| output_csv[key] = value.map{|r| r.revenue}.reduce(:+)}
	end
end
