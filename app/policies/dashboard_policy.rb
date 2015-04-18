class DashboardPolicy < Struct.new(:user, :dashboard)
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end
end