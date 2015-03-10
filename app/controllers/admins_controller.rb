class AdminsController < UsersController
  before_filter :ensure_admin!

  def index
    super
  end

  def show
    super
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Admin updated."
    else
      redirect_to users_path, :alert => "Unable to update Admin."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  def ensure_admin!
    unless @user.admin?
      sign_out current_user;
      redirect_to root_path;
      return false;
  end
    
  end
end
