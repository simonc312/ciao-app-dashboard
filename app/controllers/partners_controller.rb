class PartnersController < UsersController
  before_filter :ensure_partner!


  def create
    @partner = Partner.new(partner_params)
  end

  def update
    @user = Partner.find(params[:id])
    authorize @user
    if @user.update_attributes(partner_params)
      redirect_to partners_path, :notice => "Partner updated."
    else
      redirect_to partners_path, :alert => "Unable to update Partner."
    end
  end

  def destroy
    user = Partner.find(params[:id])
    authorize user
    user.destroy
    redirect_to partners_path, :notice => "Partner deleted."
  end

  private

  
  def partner_params
    #params.require(:partner).permit!
    params.require(:partner).permit(:employee_size,:revenue_size,:address,:city,:country,:zipcode,:user_attributes => [:id,:name,:email,:password,:role,:roleable])
  end

  def ensure_partner!
    unless @user.partner?
      sign_out current_user;
      redirect_to root_path;
      return false;
  end

  end
end
