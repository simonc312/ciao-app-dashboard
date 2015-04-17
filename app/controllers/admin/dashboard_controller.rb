class Admin::DashboardController < ApplicationController
  helper_method :partner_revenue, :ciao_app_user_sign_up
  def index
  	@ciaoappuser = Ciaoappuser.group(:gender).group_by_week(:signed_up_at).count
  end

  def create_partner
  end

  def new_partner
  end

  def update_partner 
  end 

  def partner_revenue
    render json: Partner.group(:country).sum(:revenue_size).map{|k,v|[Partner.countries.keys[k].titleize,v]}
  end

  def ciao_app_user_sign_up
    render json: Ciaoappuser.group(:gender).group_by_week(:signed_up_at).count.chart_json
  end

end
