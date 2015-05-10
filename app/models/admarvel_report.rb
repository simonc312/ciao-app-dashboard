class AdmarvelReport
	PROPERTIES = [:date, :advertiserad_network_name, :campaign_name, :site_id,	:site_name,	:publisher_id,	:publisher_name,	:requests,	:impressions,	:fill_rate,	:clicks,	:ctr,	:ecpm,	:revenue]
	PROPERTIES.each { |prop|
		attr_accessor prop
	}

	def initialize(attributes={})
		attributes.each { |key,value|
			self.send("#{key}=",value) if PROPERTIES.member? key
		}
	end

	def self.site_headers
		PROPERTIES
  end

	private  

end