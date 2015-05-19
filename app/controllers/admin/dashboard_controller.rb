class Admin::DashboardController < ApplicationController
  helper_method :partner_revenue, :ciao_app_user_sign_up
  before_filter :ensure_admin!
  def index
    #ap params
    @admarvel_report = current_user.roleable.admarvel_site_report_call({type: "site", date: {start: "2015-01-10", end: "2015-04-20"}, site_ids: "95958"})
  	@ciaoappuser = Ciaoappuser.filter(user_filter_params).filter(params.slice(:graph_frequency)).count
    @partner = Partner.filter(partner_filter_params)
    @partner_graph = Partner.group(:country).sum(:revenue_size).map{|k,v|[Partner.countries.keys[k].titleize,v]}
    @totalRevenue = @partner.sum(:revenue_size)
    @averageRevenue = @totalRevenue / Partner.count #make this reflect the actual subset of partners 
    @totalFixedCosts = current_user.roleable.currentFixedCosts()
    @totalCosts = @totalRevenue / 3 + @totalFixedCosts.sumCosts()
  end

  def create_partner
  end

  def new_partner
  end

  def update_partner 
  end 

  def update_fixed_costs
    @totalFixedCosts = current_user.roleable.currentFixedCosts();
    if @totalFixedCosts.update_attributes(fixed_cost_params)
      redirect_to admin_dashboard_path, :notice => "Fixed Costs updated."
    else
      redirect_to admin_dashboard_path, :alert => "Unable to update Fixed Costs."
    end
  end

  def update_user_filters
    #ap params
    redirect_to admin_dashboard_path(user_filter_params), :notice => "User Filters updated."
  end

  def update_graph_filters
    #ap params
    redirect_to admin_dashboard_path(graph_filter_params), :notice => "Graph Bar Filters updated."
  end

  def partner_revenue
    render json: Partner.group(:country).sum(:revenue_size).map{|k,v|[Partner.countries.keys[k].titleize,v]}
  end

  def ciao_app_user_sign_up
    render json: Ciaoappuser.group(:gender).group_by_week(:signed_up_at).count.chart_json
  end

  private 
    def ensure_admin!
      unless current_user && current_user.admin?
        redirect_to root_path;
        return false;
      end
    end

    def fixed_cost_params
      params.require(:fixed_cost).permit(:salaries,:rent,:server_hosting,:misc)
    end

    def user_filter_params
      params.slice(:country_code, :state_id, :gender,:age)
    end

    def graph_filter_params
      params.slice(:online_channels,:offline_channels,:graph_frequency,:graph_value,:graph_type,:date)
    end

    def partner_filter_params
      params.slice(:offline_channels)
    end
end
