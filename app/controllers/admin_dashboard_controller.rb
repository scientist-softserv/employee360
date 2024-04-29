class AdminDashboardController < ApplicationController
  before_action :require_admin
  # before_action :require_superadmin

  def index
    @users = User.all
  end


  private

  def require_admin
    unless current_user.admin? || current_user.superadmin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  # def require_superadmin
  #   unless current_user.superadmin?
  #     redirect_to root_path, alert: "You are not authorized to access this page."
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
