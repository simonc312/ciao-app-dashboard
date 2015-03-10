class CiaoUsersController < UsersController



  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
