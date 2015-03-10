class RegistrationsController < Devise::RegistrationsController

	def create 
		super
	end

	protected 
	def after_sign_in_path_for(resource)
		role = resource.roleable_type
		  stored_location_for(resource) ||
	    if role.is_a?(User)
	    	user_root_path
	    elsif role.is_a?(Admin)
	    	admin_dashboard_path
	   	elsif role.is_a?(Partner)
	    	partner_dashboard_path
	    else
	    	super
	    end
	end
	
	private
	def partner_params
		params.require(:user).permit(:employee_size,:revenue_size,:address,:city,:country,:zipcode)
	end

end