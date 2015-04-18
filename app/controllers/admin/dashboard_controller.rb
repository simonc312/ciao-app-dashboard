class Admin::DashboardController < ApplicationController
  helper_method :partner_revenue, :ciao_app_user_sign_up
  before_filter :ensure_admin!
  def index
  	@ciaoappuser = Ciaoappuser.group(:gender).group_by_week(:signed_up_at).count
    @totalRevenue = Partner.sum(:revenue_size);
    @averageRevenue = @totalRevenue / Partner.count;
    @totalCosts = @totalRevenue / (1+Random.rand(3));
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

  private 
    def ensure_admin!
      unless current_user.admin?
        redirect_to root_path;
        return false;
      end
  end
end
