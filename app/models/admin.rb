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
		# hand case where date start - date end > 30 days into seperate calls
		# require date start and end to be valid
		queries = splitToMaxDateRequests(query,Admarvel::DATE_FORMAT)

		queries.each do |query|
			url = Admarvel.new(query).site_report_url
			ap url
			#only fetch url_request if cache is not fresh 
			# careful need to handle fetches if error thrown
			url_request = lambda { open(url).read }
			body = ApiRequest.cache(url,Admarvel::CACHE_POLICY,url_request)
			new_csv = CSV.new(body,:headers => Admarvel::SITE_HEADERS,:header_converters => :symbol, :converters => [:all, :blank_to_nil, :currency_to_int])
			new_csv = new_csv.to_a[2...-1]
			output_csv = output_csv.concat(new_csv.map {|data|
				AdmarvelReport.new(data)
			})
		end

		#concat all the different output_csv together.
		output_csv =  output_csv.group_by {|report| report.campaign_name }
		#ap output_csv
		return output_csv.each{|key,value| output_csv[key] = value.map{|r| r.revenue}.reduce(:+)} 
		
	end

	def splitToMaxDateRequests(query,date_format)
		
		date_ranges = [];
		date_start = Date.strptime(query[:date][:start],date_format)
		date_end = Date.strptime(query[:date][:end],date_format)
		while((date_end - date_start).days > 30.days)
			mid_end = date_start + 30.days
			date_ranges.push({start: date_start.strftime(date_format), end: mid_end.strftime(date_format)})
			date_start = date_start + 31.days
		end
		# add remainder
		date_ranges.push({start: date_start.strftime(date_format), end: date_end.strftime(date_format)})
		# save as modified query
		date_ranges.map do |date|
			queryCopy = Marshal.load(Marshal.dump(query))
			queryCopy[:date][:start] = date[:start]
			queryCopy[:date][:end] = date[:end]
			queryCopy
		end
	end
end
