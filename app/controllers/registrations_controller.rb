class RegistrationsController < Devise::RegistrationsController

	def create 
		super

		#@partner = Partner.new(partner_params)
		#@user.roleable = Partner.new(partner_params)

	    #if @partner.save
	    	#redirect_to partners_dashboard_path
    		#flash[:success] = "Created Partner!"
	    #else 
	      	#flash[:warning] = "Something went wrong!"
	    #end
	    
	end

	def new 
		super
	end

	protected 
	def after_sign_in_path_for(resource)
		role = resource.roleable_type
		  #stored_location_for(resource) ||
	    if role.eql?("User")
	    	user_root_path
	    elsif role.eql?("Admin")
	    	admin_dashboard_path
	   	elsif role.eql?("Partner")
	    	partner_dashboard_path
	    else
	    	super
	    end
	end
	
	private
	def partner_params
		params.require(:partner).permit(:employee_size,:revenue_size,:address,:city,:country,:zipcode,:user_attributes => [:id,:name,:email,:password,:role,:roleable])
	end

	def form_params
		params.require(:user).permit(:name,:email,:password,:role,:roleable_attributes => [:employee_size,:revenue_size,:address,:city,:country,:zipcode])
	end

end