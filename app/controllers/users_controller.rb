class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  helper_method :partner_renenue, :ciao_app_user_sign_up

  def index
    @users = User.all
    @partners = Partner.all
    @ciaoappusers = Ciaoappuser.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def partner_revenue
  render json: Partner.group(:country).sum(:revenue_size).map{|k,v|[Partner.countries.keys[k].titleize,v]}
  end

  def ciao_app_user_sign_up
  render json: Ciaoappuser.group(:gender).group_by_week(:signed_up_at).count.chart_json
  end


  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
