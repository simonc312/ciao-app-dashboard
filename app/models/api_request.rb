class ApiRequest < ActiveRecord::Base
	validates :url, presence: true, uniqueness: true

	def self.cache(url, cache_policy,lambda)
		find_or_initialize_by(url: url).cache(cache_policy,lambda)
	end

	def cache(cache_policy, lambda)
		if (new_record? || updated_at < cache_policy.call)
			update_attributes(updated_at: Time.zone.now, response_body: lambda.call)
		end
		return response_body
	end
end