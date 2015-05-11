class Admarvel

	BASE_URL = 'http://map.admarvel.com'
	CACHE_POLICY = lambda { 30.days.ago } 
	SITE_HEADERS = ["Date", "Advertiser/Ad Network Name", "Campaign Name",	"Site ID",	"Site Name",	"Publisher ID",	"Publisher Name",	"Requests",	"Impressions",	"Fill Rate",	"Clicks",	"CTR",	"eCPM",	"Revenue"]

	attr_reader :type, :date, :site_ids

	def initialize(query)
		@type = query[:type]
		@date = query[:date]
		@site_ids = query[:site_ids] 
	end
	
	def site_report_url
		BASE_URL + '/reports?' + {
			type: type,
			uname: Rails.application.secrets.admarvel_username,
			upassword: Rails.application.secrets.admarvel_password,
			date_start: date_start,
			date_end: date_end,
			sids: site_ids
		}.to_query
	end

	private 

	def date_start
		date[:start]
	end

	def date_end
		date[:end]
	end 

end